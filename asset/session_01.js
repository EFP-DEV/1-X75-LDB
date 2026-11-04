(() => {
  "use strict";

  const board = document.querySelector("#board");
  const viewer = document.querySelector("#viewer");
  const viewerImage = document.querySelector("#viewer-image");
  const viewerPlaceholder = document.querySelector("#viewer-placeholder");
  const viewerTitle = document.querySelector("#viewer-title");
  const margin = 16;
  let topLayer = 0;
  let drag = null;
  let openedCard = null;

  const clamp = (value, min, max) => Math.min(Math.max(value, min), max);
  const cards = Array.from(board.querySelectorAll(".document"), (element) => ({
    element,
    image: element.querySelector("img"),
    x: Number(element.dataset.x),
    y: Number(element.dataset.y),
    suppressClick: false,
  }));

  function bounds(card) {
    return {
      width: Math.max(0, board.clientWidth - card.element.offsetWidth - margin * 2),
      height: Math.max(0, board.clientHeight - card.element.offsetHeight - margin * 2),
    };
  }

  function place(card) {
    const { width, height } = bounds(card);
    card.element.style.left = `${margin + card.x * width}px`;
    card.element.style.top = `${margin + card.y * height}px`;
  }

  function move(card, left, top) {
    const { width, height } = bounds(card);
    card.x = width ? clamp((left - margin) / width, 0, 1) : 0;
    card.y = height ? clamp((top - margin) / height, 0, 1) : 0;
    place(card);
  }

  function raise(card) {
    card.element.style.zIndex = String(++topLayer);
  }

  function showImage(card) {
    openedCard = card;
    viewerTitle.textContent = `Document ${card.element.dataset.id}`;
    const loaded = card.element.classList.contains("is-loaded");
    viewerImage.hidden = !loaded;
    viewerPlaceholder.hidden = loaded;
    if (loaded) {
      viewerImage.src = card.image.currentSrc || card.image.src;
      viewerImage.alt = card.image.alt;
    } else {
      viewerImage.removeAttribute("src");
      viewerImage.alt = "";
    }
    viewer.showModal();
  }

  function endDrag(event) {
    if (!drag || drag.pointerId !== event.pointerId) return;
    const { card, pointerId, moved } = drag;
    drag = null;
    card.suppressClick = moved;
    card.element.classList.remove("is-dragging");
    document.body.classList.remove("is-dragging");
    if (card.element.hasPointerCapture(pointerId)) {
      card.element.releasePointerCapture(pointerId);
    }
  }

  for (const card of cards) {
    const { element, image } = card;
    // A numbered fallback keeps a document visible if its image fails to load.
    element.setAttribute("aria-label", `${image.alt} : agrandir`);

    function imageState() {
      element.classList.toggle("is-loaded", image.complete && image.naturalWidth > 0);
      place(card);
    }

    image.addEventListener("load", imageState);
    image.addEventListener("error", imageState);
    imageState();

    element.addEventListener("focus", () => raise(card));
    element.addEventListener("dragstart", (event) => event.preventDefault());

    element.addEventListener("pointerdown", (event) => {
      if (event.button !== 0 || !event.isPrimary || drag) return;
      card.suppressClick = false;
      element.focus({ preventScroll: true });
      raise(card);
      drag = {
        card,
        pointerId: event.pointerId,
        startX: event.clientX,
        startY: event.clientY,
        left: element.offsetLeft,
        top: element.offsetTop,
        moved: false,
      };
      element.setPointerCapture(event.pointerId);
    });

    element.addEventListener("pointermove", (event) => {
      if (!drag || drag.card !== card || drag.pointerId !== event.pointerId) return;
      const dx = event.clientX - drag.startX;
      const dy = event.clientY - drag.startY;
      // A small hand movement during a click must not start a drag.
      if (!drag.moved && Math.hypot(dx, dy) < 5) return;
      drag.moved = true;
      element.classList.add("is-dragging");
      document.body.classList.add("is-dragging");
      move(card, drag.left + dx, drag.top + dy);
    });

    element.addEventListener("pointerup", endDrag);
    element.addEventListener("pointercancel", endDrag);
    element.addEventListener("lostpointercapture", endDrag);

    element.addEventListener("click", (event) => {
      if (card.suppressClick && event.detail !== 0) {
        card.suppressClick = false;
        return;
      }
      showImage(card);
    });

    element.addEventListener("keydown", (event) => {
      if (event.altKey || event.ctrlKey || event.metaKey || drag) return;
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        if (!event.repeat) showImage(card);
        return;
      }
      const direction = {
        ArrowLeft: [-1, 0],
        ArrowRight: [1, 0],
        ArrowUp: [0, -1],
        ArrowDown: [0, 1],
      }[event.key];
      if (!direction) return;
      event.preventDefault();
      const step = event.shiftKey ? 1 : 10;
      move(card, element.offsetLeft + direction[0] * step, element.offsetTop + direction[1] * step);
    });
  }

  document.querySelector("#close-viewer").addEventListener("click", () => viewer.close());
  viewer.addEventListener("click", (event) => {
    if (event.target !== viewer) return;
    const rect = viewer.getBoundingClientRect();
    if (event.clientX < rect.left || event.clientX > rect.right ||
        event.clientY < rect.top || event.clientY > rect.bottom) {
      viewer.close();
    }
  });
  viewer.addEventListener("close", () => {
    viewerImage.removeAttribute("src");
    viewerImage.hidden = true;
    openedCard?.element.focus({ preventScroll: true });
    openedCard = null;
  });

  // Positions live only in memory. Reloading always starts from the HTML coordinates.
  new ResizeObserver(() => cards.forEach(place)).observe(board);
})();
