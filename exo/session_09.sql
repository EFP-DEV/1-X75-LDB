INSERT INTO category (slug, label) VALUES
('web', 'Web'),
('system', 'System'),
('mobile', 'Mobile'),
('data', 'Data'),
('game', 'Game Development'),
('scripting', 'Scripting'),
('academic', 'Academic / Research');


INSERT INTO theme (slug, label) VALUES
('backend', 'Backend'),
('frontend', 'Frontend'),
('low-level', 'Low-level'),
('high-level', 'High-level'),
('functional', 'Functional'),
('object-oriented', 'Object-Oriented'),
('multi-paradigm', 'Multi-paradigm');


INSERT INTO tag (slug, label) VALUES
('compiled', 'Compiled'),
('interpreted', 'Interpreted'),
('static-typing', 'Static typing'),
('dynamic-typing', 'Dynamic typing'),
('functional', 'Functional'),
('oop', 'Object-oriented'),
('memory-safe', 'Memory safe'),
('performance', 'High performance'),
('beginner-friendly', 'Beginner friendly'),
('enterprise', 'Enterprise'),
('open-source', 'Open source'),
('cross-platform', 'Cross-platform'),
('web-first', 'Web first'),
('academic', 'Academic'),
('systems', 'Systems programming');

INSERT INTO item (
  slug, label, short_description, content, main_image,
  status, created_at, updated_at,
  category_id, theme_id
) VALUES
('c', 'C', 'Low-level systems language', NULL, NULL, 'published', NOW(), NOW(), 2, 3),
('cpp', 'C++', 'High-performance systems language', NULL, NULL, 'published', NOW(), NOW(), 2, 7),
('rust', 'Rust', 'Memory-safe systems programming', NULL, NULL, 'published', NOW(), NOW(), 2, 3),
('go', 'Go', 'Simple concurrent backend language', NULL, NULL, 'published', NOW(), NOW(), 1, 7),
('python', 'Python', 'General-purpose scripting language', NULL, NULL, 'published', NOW(), NOW(), 6, 4),
('javascript', 'JavaScript', 'Web programming language', NULL, NULL, 'published', NOW(), NOW(), 1, 7),
('typescript', 'TypeScript', 'Typed superset of JavaScript', NULL, NULL, 'published', NOW(), NOW(), 1, 7),
('php', 'PHP', 'Server-side web language', NULL, NULL, 'published', NOW(), NOW(), 1, 4),
('java', 'Java', 'Enterprise-grade language', NULL, NULL, 'published', NOW(), NOW(), 2, 6),
('kotlin', 'Kotlin', 'Modern JVM and Android language', NULL, NULL, 'published', NOW(), NOW(), 3, 7),
('swift', 'Swift', 'Apple ecosystem language', NULL, NULL, 'published', NOW(), NOW(), 3, 7),
('ruby', 'Ruby', 'Expressive scripting language', NULL, NULL, 'published', NOW(), NOW(), 6, 4),
('haskell', 'Haskell', 'Pure functional language', NULL, NULL, 'published', NOW(), NOW(), 7, 5),
('scala', 'Scala', 'Functional and OOP on JVM', NULL, NULL, 'published', NOW(), NOW(), 7, 7),
('lua', 'Lua', 'Embedded scripting language', NULL, NULL, 'published', NOW(), NOW(), 6, 4),
('r', 'R', 'Statistical computing language', NULL, NULL, 'published', NOW(), NOW(), 4, 4),
('matlab', 'MATLAB', 'Scientific computing language', NULL, NULL, 'published', NOW(), NOW(), 4, 7);


INSERT INTO taguer (item_id, tag_id) VALUES
-- C
(1, 1), (1, 8), (1, 15),

-- C++
(2, 1), (2, 8), (2, 6),

-- Rust
(3, 1), (3, 7), (3, 15),

-- Go
(4, 1), (4, 12), (4, 10),

-- Python
(5, 2), (5, 4), (5, 9),

-- JavaScript
(6, 2), (6, 13), (6, 12),

-- TypeScript
(7, 1), (7, 3), (7, 13),

-- PHP
(8, 2), (8, 13), (8, 10),

-- Java
(9, 1), (9, 3), (9, 10),

-- Kotlin
(10, 1), (10, 6), (10, 12),

-- Swift
(11, 1), (11, 6), (11, 12),

-- Ruby
(12, 2), (12, 9),

-- Haskell
(13, 1), (13, 5), (13, 14),

-- Scala
(14, 1), (14, 5), (14, 6),

-- Lua
(15, 2), (15, 12),

-- R
(16, 2), (16, 14),

-- MATLAB
(17, 1), (17, 14);
