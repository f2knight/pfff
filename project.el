
; go to start of line with a string_of_info string, like "/a/b/c" line 43
; and it will go ther
(fset 'pfff-goto-error
   [?\C-s ?\" left right ?\C-  ?\C-s ?\" left ?\M-w ?\C-x ?\C-f ?\C-x ?\C-f ?\C-y return ?\C-\M-l ?\C-s ?l ?i ?n ?e ?  left right ?\C-  ?\C-e ?\M-w ?\C-\M-l ?\M-g ?\C-y return])

; when have file:line format
(fset 'pad-goto-error
   [?\C-a ?\C-  ?\C-s ?: left ?\M-w ?\C-x ?\C-f ?\C-x ?\C-f ?\C-y return ?\C-\M-l right ?\C-  C-right ?\M-w ?\C-\M-l ?\M-g ?\C-y return])

(fset 'pad-goto-backtrace
   [?\C-s ?[ left right ?\C-  ?\C-s ?: left ?\M-w ?\C-x ?\C-f ?\C-x ?\C-f ?\C-y return ?\C-x ?b return right ?\C-  C-right ?\M-w ?\C-x ?b return ?\M-g ?\C-y return])

(defun pad-ocaml-project-pfff ()
  (interactive)

  (setq 
   pad-ocaml-project-path "/home/pad/pfff"
   pad-ocaml-project-subdirs 
   (split-string 
    "commons globals commons/lib-sexp commons/lib-json commons/ocamlextra
     h_version-control
     h_visualization
     h_program-lang
     lang_php/parsing
     lang_js/parsing
     lang_sql/parsing
     lang_php/analyze
     lang_php/analyze/basic
     lang_php/analyze/foundation
     lang_php/analyze/database
     lang_php/analyze/qa_test
     lang_php/analyze/qa_code
     lang_php/analyze/static_analysis
     lang_php/analyze/checker
     gui
     facebook
     mini_php
     external/ocamlmysql
     external/ocamlmysql/orm-mysql
     external/ocamlthrift
     external/ocamlgl/SRC
     external/ocamlcairo/src
     meta
     facebook/fb_common
     facebook/fb_org
     facebook/fb_db
     facebook/check_module
     facebook/flib_navigator
     facebook/visual
     facebook/qa_test
     facebook/qa_code
     facebook
     lang_php/matcher
     lang_php/compile
     facebook/thrift
     facebook/thrift/gen-ocaml
    ")
   pad-ocaml-project-toplevel "pfff.top"
   )

; branches 
;
;  master
;
;  cyclomatic_R
;  phpunit
;  commit_hooks
;  coverage
;  data_flow
;  flib_navigator
;  sgrep
;  test_rank
;  type_inference
;  visualization
;  xdebug
;  xhp
;  check_module
;  interpreter
;  jit

  ; --------------------------------------------------------------------------
  ; pfff
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "pfff"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 60

       ;(0 "-tokens_php /home/pad/c-pfff/tests/test_db/foo_embeded_call_in_heredoc.php")
       ;(0 "-tokens_php /home/pad/c-pfff/tests/test_db/foo_embeded_call.php")
       ;(0 "-tokens_php /home/pad/c-pfff/tests/encaps_array.php")
       ;(0 "-tokens_php /home/pad/c-pfff/tests/here_doc_simple.php")
       (0 "-tokens_php /home/pad/c-pfff/tests/interpolation_curly_brace.php")

       (1 "-parse_php /home/pad/c-pfff/tests/position.php")
       (2 "-sexp_php /home/pad/c-pfff/tests/foo.php")

       (3 "-parse_php /home/pad/www/html/pad/")
       (4 "-parse_php /home/pad/c-pfff/tests/if.php")

       ;(5 "-typing_mini /home/pad/c-pfff/tests/typing/union.php")
       (5 "-typing_mini /home/pad/c-pfff/tests/typing/int.php")

       (20 "-json /home/pad/pfff/tests/json/float_pb.php")

       (40 "-unit_test")

       (50 "-parse_xhp /home/pad/pfff/tests/xhp/foo.php")
       (51 "-parse_xhp /home/pad/www/flib/share/bookmarklet/ui/bookmarklet.php")
       (52 "-parse_xhp /home/pad/www/flib/utils/survey/ui/SurveyView.php")
       (53 "-parse_xhp /home/pad/pfff/tests/xhp/xhp_line_bug2.php")
       (54 "-parse_xhp /home/pad/www/flib/intern/ui/explorer/elements.php")
       (55 "-parse_xhp /home/pad/pfff/tests/xhp/xhp_line_bug4.php")

       (60 "-parse_php /home/pad/pfff/tests/xhp_pb_but_ok/colon_ambiguity.php")

       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; pfff_db
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "pfff_db"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1

       (0 "/home/pad/www/html/pad/")
       (1 "-metapath /tmp/xdb /home/pad/c-pfff/tests/test_db/")
       (2 "-deadcode_analysis /tmp/xdb")

       (3 "-type_php /home/pad/c-pfff/tests/typing/foo.php")
       (4 "-type_php /home/pad/c-pfff/tests/typing/basic.php")
       (5 "-idl_to_php /home/pad/c-pfff/tests/builtins3.php")

       (10 "-deadcode_patch_info /tmp/deadcode_patches/flib/gender//sgrimm_dcorson__19-Dec-2007__gender.php.patch")

       (20 "-deadcode_patches_stat_www")

       (30 "-test_diffcamp")
       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; pfff_misc
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/pfff_misc"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 100

       (0 "-test")

       (1 "-test_squarify")
       (2 "-test_treemap_dir /home/pad/etc/ squarified")
       (3 "-test_code_rank /tmp/code_rank_db/")
       (4 "-index_db_xdebug /tmp/flib_db /tmp/dumpfile.xt")
       (5 "-batch_mode -type_xdebug_php /home/pad/pfff/tests/type_inference/union_basic.php")
       (10 "-test_treemap_php /home/pad/www/flib/")
       (20 "-test includees")
       (30 "-metapath /tmp/test_db/ /home/pad/pfff/tests/facebook/mini_www/")
       (31 "-includers_php /tmp/test_db/  /home/pad/pfff/tests/facebook/mini_www/flib/core/__init__.php")



       (32 "-test_track_function_result foo /home/pad/pfff/tests/analysis/dfg/simple.php")
       (33 "-test_pil /home/pad/pfff/tests/analysis/pil/stmt.php ")
       (34 "-cfg_pil /home/pad/pfff/tests/analysis/pil/cfg.php ")
       (35 "-cfg_pil /home/pad/pfff/tests/analysis/dfg/basic.php ")

       (37 "-test_track_function_result foo /home/pad/pfff/tests/analysis/dfg/simple.php")
       (38 "-test_track_function_result foo /home/pad/pfff/tests/analysis/dfg/basic.php")
       (39 "-generate_html /tmp/pfff_db /home/pad/www/flib/intern/module/module.php")


       (50 "-parse_js /home/pad/pfff/tests/js/foo.js")

       (100 "-foo")
       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; sgrep
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "sgrep"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 4
       
       (0 "-e 1 /home/pad/c-pfff/tests/")
       (1 "-f /home/pad/c-pfff/tests/semantic_grep/method_call.php  /home/pad/c-pfff/tests/method_call.php")
       (2 " -e foo(X,X) /home/pad/pfff/tests/sgrep/linear_pattern.php")



       (3 " -find_run_once_pattern tests/sgrep/run_once_pattern.php ")

       (4 " -f /home/pad/pfff/tests/php/sgrep/foreach.sgrep /home/pad/pfff/tests/php/sgrep/foreach.php")
       )
     
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; spatch
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "spatch"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 5

       (0 "-send_mail_transfo /home/pad/pfff/tests/spatch/send_mail.php")
       (1 "-fbt_xhp_izer /home/pad/pfff/tests/php/spatch/fbt.php ")
       (2 "-c /home/pad/pfff/tests/php/spatch/foo.spatch /home/pad/pfff/tests/php/spatch/foo.php")
       (3 "-c /home/pad/pfff/tests/php/spatch/border.spatch /home/pad/pfff/tests/php/spatch/border.php")
       (4 "-test")
       (5 "-c /home/pad/redirect.spatch /home/pad/redirect.php")
       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; scheck
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "scheck"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 0

       (0 "-test")
       (1 "-test_pil /home/pad/pfff/tests/php/pil/qualifier.php")
       )
     )
    )
   )


  ; --------------------------------------------------------------------------
  ; db_light
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "pfff_db_light"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 0
       
       (0 
        "-gen_pleac /home/pad/software-src/pleac/pleac_ocaml.data /home/pad/software-src/pleac/skeleton.sgml")
       )
     
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; treemap_viewer
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "h_visualization/treemap_viewer"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 4

       (0 "")
       (1 "-test_of_json /home/pad/pfff/h_visualization/examples/treemap/ex.json")
       (2 "-test_treemap ordered")
       (3 "-test_orderify")
       (4 "/home/pad/pfff/h_visualization/examples/treemap/ex.json")
       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; vcs
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "h_version-control/vcs"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 5

       (0 "")
       (1 "-test_git2 /home/pad/c-pfff 83494ee5fe67303de1bfa0ca363a32fe8f32f63a")
       (2 "-test_git2 /home/pad/c-pfff 30b1fcf436c90d9a78c01d4ebec0e6ab0a4a1edd")
       (3 "-test_git2 /home/pad/c-pfff e44f7d8a9703eda693aec4baee9323df36970865")
       (4 "-test_git2 /home/pad/c-pfff 6d27fd0f1eb56184011683530c224f90490f45c7")
       (5 "-test_git2 /home/pad/c-pfff 01288f1e2e56c87de5d4363c94dac7458583cd94")
       )
     )
    )
   )


  ; --------------------------------------------------------------------------
  ; php treemap_viewer
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/visual/visual"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1

       (0 "")
       (1 "-test_treemap_git /home/pad/www/flib/")
       )
     )
    )
   )

  ; --------------------------------------------------------------------------
  ; pfff_gui
  ; --------------------------------------------------------------------------

  (setq
   pad-ocaml-project-prog     "pfff_browser"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 2
       (0 "/tmp/pfff_db")
       (1 "/tmp/xdb")
       (2 "/tmp/test_db")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; meta/
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "meta/ffi"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 21
       (0 "/home/pad/c-pfff/demos/foo0.php")
       (1 "/home/pad/c-pfff/tests/dependencies/thrift.php")
       ;(1 "-python_gen exprbis")
       (2 "-python_gen program")
       (3 "-python_gen is_ref")
       (10 "-python_gen_all")
       (20 "-dump_php_ml /home/pad/c-pfff/tests/dependencies/thrift.php")
       (21 "-dump_php_ml /home/pad/pfff/demos/foo.php")
       )
     ))
   )

  (setq
   pad-ocaml-project-prog     "meta/gen_code"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 21
       (0 "/home/pad/c-pfff/demos/foo0.php")
       (1 "/home/pad/c-pfff/tests/dependencies/thrift.php")
       ;(1 "-python_gen exprbis")
       (2 "-python_gen program")
       (3 "-python_gen is_ref")
       (10 "-python_gen_all")
       (20 "-dump_php_ml /home/pad/c-pfff/tests/dependencies/thrift.php")
       (21 "-dump_php_ml /home/pad/pfff/demos/foo.php")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; interpreter/compiler
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "compile_php/phpcc"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1
       (0 "/home/pad/c-pfff/tests/interpreter/hello_world.php")
       (1 "/home/pad/c-pfff/tests/interpreter/fact.php")
       )
     ))
   )



  ; --------------------------------------------------------------------------
  ; facebook/
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/pfff_fb"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 4
       (0 "-test_treemap_misc")
       (1 "-test_treemap_db /tmp/pfff_db")
       (2 "-lib_dependencies2 /home/pad/www/lib/platform_install.php /tmp/pfff_db")
       (3 "-getMock_transfo /home/pad/www/flib/intern/load_balancer/syncer/__tests__/LoadBalancerConfigSnapshotTest.php")
       (4 "-getMock_transfo /home/pad/pfff/tests/ppp/getMock_ex2.php")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; facebook/qa_code/checker
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/qa_code/checker"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 2
       (0 "/home/pad/www/html/ajax/groups/mall/ufi.php")
       (1 "-test_functions_json")
       (2 "/home/pad/pfff/demos/foo.php")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; facebook/reaper
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/dead_code/reaper"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 0
       (0 "-deadcode_analysis_diff /tmp/deadcode_db/")
       )
     ))
   )


  ; --------------------------------------------------------------------------
  ; facebook/fb_phpunit
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/fb_phpunit/fb_phpunit_wrap"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1
       (0 "")
       (1 "/home/pad/www/flib/utils/dependencies/__tests__/")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; facebook/qa_test
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/qa_test/qa_test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 3
       (0 "")
       (1 "-find_missing_emails /home/pad/pfff/tests/facebook/test_notifications/")
       (2 "-add_emails_annot foo@bar /home/pad/pfff/tests/facebook/test_notifications/bar_noemails.php")
       (3 "-php_root /home/pad/pfff/tests/facebook/ -add_emails_annot foo@bar /home/pad/pfff/tests/facebook/test_notifications/other/3.php")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; facebook/thrift
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/thrift/client_php"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1
       (0 "")
       (1 "-test_thrift")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; facebook/check_module
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "facebook/check_module/checkModule"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 0
       (0 "-test")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; pfff_visual
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "pfff_visual"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 0
       (0 "-ss 1 -with_layer /tmp/layer_security.json  /home/pad/pfff/facebook/tests/mini_www/")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; pfff_test
  ; --------------------------------------------------------------------------
  (setq
   pad-ocaml-project-prog     "pfff_test"
   ;pad-ocaml-project-prog "gui/test"
   pad-ocaml-project-args 
   (join-string 
    (list 
     "-debugger"
     (case 1
       (0 "all")
       (1 "sgrep")
       )
     ))
   )

  ; --------------------------------------------------------------------------
  ; for the help system, for C-c C-h to find where to look for
  (mapcar (lambda (p) 
            (ocaml-add-path (concat pad-ocaml-project-path "/" p))
            (ocaml-add-path "/usr/lib/ocaml/3.09.2/lablgtk2")
            (ocaml-add-path "/usr/lib/ocaml/3.09.2/lablgtksourceview")
            (ocaml-add-path "/home/pad/comments/ocamlgtk/src")
            (ocaml-add-path "/home/pad/packages/lib/ocaml/std-lib")
            (ocaml-add-path "/home/pad/packages/lib/ocaml/pkg-lib/lablgtk2")
            (ocaml-add-path "/home/pad/packages/lib/ocaml/pkg-lib/lablgtksourceview")
            (ocaml-add-path "/home/pad/packages/MacOS/lib/ocaml/std-lib/lablgl")
            )
          pad-ocaml-project-subdirs
          )
  )

  ;(setq ocaml-lib-path nil)
  ;(setq ocaml-module-alist 'lazy)
