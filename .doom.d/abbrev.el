;;-*-coding: utf-8;-*-
(define-abbrev-table 'c++-mode-abbrev-table
  '(
    ;; keywords
    ("cosnt" "const" nil :count 2)
    ("cc" "const" nil)
    ("ca" "const auto" nil)
    ("consexpr" "constexpr" nil)
    ("cexpr" "constexpr" nil)
    ("cx" "constexpr" nil)
    ("retunr" "return" nil)
    ("reutnr" "return" nil)
    ("retur" "return" nil)
    ("ret" "return" nil)
    ("rt" "return" nil)
    ("r" "return" nil)
    ("templ" "template<" nil)
    ("tpl" "template<" nil)
    ("tpn" "typename" nil)
    ("nspc" "namespace" nil)
    ("ns" "namespace" nil)
    ("st" "static" nil)
    ("inl" "inline" nil)
    ("cls" "class" nil)
    ("sct" "struct" nil)

    ;; common types
    ("lu" "long unsigned" nil)
    ("b" "bool" nil)
    ("d" "double" nil)
    ("s" "std::size_t" nil)
    ("u" "unsigned" nil)

    ;; common structures
    ("vv" "std::vector<" nil)
    ("cv" "const std::vector<" nil)
    ("um" "std::unordered_map<" nil)
    ("cum" "const std::unordered_map<" nil)
    ("uss" "unordered_set<" nil)
    ("ss" "std::set<" nil)
    ("cs" "const std::set<" nil)
    ("cstr" "const std::string" nil)
    ("cuss" "const unordered_set<" nil)
    ("str" "std::string" nil)
    ("strv" "std::string_view" nil)
    ("rangeauto" "std::ranges::range auto" nil)
    ("null" "nullptr" nil)
    ("opt" "std::optional<" nil)
    ("nopt" "std::nullopt" nil)

    ;; loops
    ("forii" "for (int i = 0; i < " nil)
    ("forjj" "for (int j = 0; j < " nil)

    ;; macros
    ("incl" "#include" nil)

    ;; iostream
    ("cout" "std::cout" nil)
    ("cuot" "std::cout" nil)
    ("cerr" "std::cerr" nil)
    ("endl" "std::endl" nil)
    ))
(define-abbrev-table 'java-mode-abbrev-table
  '(
    ;; keywords
    ("pub" "public" nil)
    ("cls" "class" nil)
    ("retunr" "return" nil)
    ("reutnr" "return" nil)
    ("retur" "return" nil)
    ("ret" "return" nil)
    ;; common types
    ;; common structures
    ;; loops
    ("forii" "for (int i = 0; i < " nil)
    ("forjj" "for (int j = 0; j < " nil)
    ;; macros
    ("imp" "import" nil)
    ;; printing
    ("println" "System.out.println(" nil)
    ))
(define-abbrev-table 'python-mode-abbrev-table
  '(
    ;; keywords
    ("retunr" "return" nil)
    ("reutnr" "return" nil)
    ("retur" "return" nil)
    ("ret" "return" nil)
    ;; common types
    ;; common structures
    ;; loops
    ;; macros
    ("imp" "import" nil)
    ;; printing
    ("pp" "print(" nil)
    ))
