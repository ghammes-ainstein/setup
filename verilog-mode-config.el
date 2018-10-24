(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(load-file "~/tools/verilog-mode/e/verilog-mode.el")

;; Enable syntax highlighting of **all** languages
(global-font-lock-mode t)

;; User customization for Verilog mode
(setq verilog-indent-level             4
      verilog-indent-level-module      4
      verilog-indent-level-declaration 4
      verilog-indent-level-behavioral  4
      verilog-indent-level-directive   4
      verilog-case-indent              4
      verilog-cexp-indent              4
      verilog-auto-newline             4
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
                                        ;      verilog-auto-lineup              'declarations
      verilog-auto-lineup              'all
      verilog-highlight-p1800-keywords nil
      verilog-linter                   "my_lint_shell_command"
      )

