(let ((amap (ViMap mapWithName:"arrowMap"))
      (gmap (ViMap mapWithName:"genericMap"))
      (imap (ViMap insertMap))
      (mmap (ViMap mapWithName:"motionMap"))
      (tmap (ViMap mapWithName:"textObjectsMap"))
      (wmap (ViMap mapWithName:"windowMap"))
      (nmap (ViMap normalMap))
      (omap (ViMap operatorMap))
      (vmap (ViMap visualMap))
      (webmap (ViMap mapWithName:"webMap"))
      (tabmap (ViMap mapWithName:"tableNavigationMap"))
      (sidemap (ViMap mapWithName:"sidebarMap"))
      (emap (ViMap explorerMap))
      (smap (ViMap symbolMap))
      (xmap (ViMap mapWithName:"exCommandMap"))
      (cmap (ViMap completionMap)))

;; arrow motions, also valid in insert mode
(amap setKey:"<right>" toMotion:"move_right_and_wrap:")
(amap setKey:"<left>" toMotion:"move_left_and_wrap:")
(amap setKey:"<down>" toMotion:"move_down_soft:" flags:ViMapLineMode parameter:nil scope:nil)
(amap setKey:"<up>" toMotion:"move_up_soft:" flags:ViMapLineMode parameter:nil scope:nil)
(amap setKey:"<pageup>" toMotion:"backward_screen:")
(amap setKey:"<pagedown>" toMotion:"forward_screen:")
(amap setKey:"<home>" toMotion:"move_first_char:")
(amap setKey:"<end>" toMotion:"move_eol:")
(amap setKey:"<alt-right>" toMotion:"end_of_word:")
(amap setKey:"<alt-left>" toMotion:"word_backward:")
(amap setKey:"<alt-down>" toMotion:"paragraph_forward:")
(amap setKey:"<alt-up>" toMotion:"paragraph_backward:")
(amap setKey:"<ctrl-right>" toMotion:"move_eol:")
(amap setKey:"<ctrl-left>" toMotion:"move_bol:")
(amap setKey:"<cmd-right>" toMotion:"move_eol:")
(amap setKey:"<cmd-left>" toMotion:"move_bol:")
(amap setKey:"<cmd-up>" toMotion:"goto_line:" flags:ViMapLineMode parameter:NO scope:nil)
(amap setKey:"<cmd-down>" toMotion:"goto_line:" flags:ViMapLineMode parameter:YES scope:nil)


;; generic commands, valid in most maps
(gmap setKey:"<cmd-1>" toAction:"switch_tab:" flags:0 parameter:0 scope:nil)
(gmap setKey:"<cmd-2>" toAction:"switch_tab:" flags:0 parameter:1 scope:nil)
(gmap setKey:"<cmd-3>" toAction:"switch_tab:" flags:0 parameter:2 scope:nil)
(gmap setKey:"<cmd-4>" toAction:"switch_tab:" flags:0 parameter:3 scope:nil)
(gmap setKey:"<cmd-5>" toAction:"switch_tab:" flags:0 parameter:4 scope:nil)
(gmap setKey:"<cmd-6>" toAction:"switch_tab:" flags:0 parameter:5 scope:nil)
(gmap setKey:"<cmd-7>" toAction:"switch_tab:" flags:0 parameter:6 scope:nil)
(gmap setKey:"<cmd-8>" toAction:"switch_tab:" flags:0 parameter:7 scope:nil)
(gmap setKey:"<cmd-9>" toAction:"switch_tab:" flags:0 parameter:8 scope:nil)
(gmap setKey:"<cmd-0>" toAction:"switch_tab:" flags:0 parameter:9 scope:nil)
(gmap setKey:"<c-P>" toAction:"show_scope:")
(gmap setKey:"<ctrl-esc>" toAction:"show_bundle_menu:")
(gmap setKey:"<cmd-esc>" toAction:"show_bundle_menu:")
; alternative key bindings for switching tabs
; the default is ctrl-tab / shift-ctrl-tab
(gmap map:"<cmd-{>" to:"<esc>gT")
(gmap map:"<cmd-}>" to:"<esc>gt")
(gmap map:"<alt-cmd-left>" to:"<esc>gT")
(gmap map:"<alt-cmd-right>" to:"<esc>gt")


;; insert map
(imap setDefaultAction:"input_character:")
(imap setAcceptsCounts:NO) ; Don't treat numbers as command counts
(imap include:amap)
(imap include:gmap)
(imap setKey:"<c-d>" toAction:"decrease_indent:")
(imap setKey:"<c-t>" toAction:"increase_indent:")
(imap setKey:"<c-h>" toAction:"input_backspace:")
(imap setKey:"<c-r>" toAction:"input_register:" flags:ViMapNeedArgument parameter:nil scope:nil)
(imap setKey:"<c-u>" toAction:"delete_bol:")
(imap setKey:"<c-w>" toAction:"delete_word:")
(imap setKey:"<cmd-bs>" toAction:"delete_bol:")
(imap setKey:"<bs>" toAction:"input_backspace:")
(imap setKey:"<tab>" toAction:"input_tab:")
(imap setKey:"<c-j>" toAction:"input_newline:")
(imap setKey:"<c-m>" toAction:"input_newline:")
(imap setKey:"<c-v>" toAction:"literal_next:" flags:ViMapNeedArgument parameter:nil scope:nil)
(imap setKey:"<c-n>" toAction:"complete_keyword:" flags:0 parameter:"p" scope:nil)	; add F to parameter for fuzzy keyword trigger
(imap setKey:"<c-x><c-n>" toAction:"complete_keyword:" flags:0 parameter:"pf" scope:nil)
(imap setKey:"<c-x><c-f>" toAction:"complete_path:" flags:0 parameter:"p" scope:nil) ; p parameter automatically inserts common prefix
(imap setKey:"<c-p>" toAction:"complete_keyword:" flags:0 parameter:"d" scope:nil)  ; d parameter sorts descending
(imap setKey:"<Esc>" toAction:"normal_mode:")
(imap setKey:"<ctrl-c>" toAction:"normal_mode:")
(imap setKey:"<Del>" toAction:"input_forward_delete:")
(imap map:"<cmd-v>" to:"<ctrl-r>*")
(imap map:"<cmd-z>" to:"<esc>u")
(imap map:"<cmd-Z>" to:"<esc><cmd-Z>")
;(imap map:"<cmd-del>" to:"<esc>ax<esc>d$a")

;; Restore normal Mac OS X keyboard actions in insert mode.
(imap setKey:"<alt-bs>" toAction:"deleteWordBackward:")
(imap setKey:"<alt-del>" toAction:"deleteWordForward:")
(imap setKey:"<alt-left>" toAction:"moveWordLeft:")
(imap setKey:"<alt-right>" toAction:"moveWordRight:")


;; create a separate mapping for motion commands
;; and include it in the normal, operator and visual maps
(mmap include:amap)
(mmap setKey:"<c-h>" toMotion:"move_left:")
(mmap setKey:"<c-j>" toMotion:"move_down:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"<c-m>" toMotion:"move_down_bol:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"<bs>" toMotion:"move_left:")
(mmap setKey:"<space>" toMotion:"move_right:")
(mmap setKey:"B" toMotion:"word_backward:")
(mmap setKey:"E" toMotion:"end_of_word:")
(mmap setKey:"F" toMotion:"move_back_to_char:" flags:ViMapNeedArgument parameter:nil scope:nil)
(mmap setKey:"G" toMotion:"goto_line:" flags:ViMapLineMode parameter:YES scope:nil)
(mmap setKey:"H" toMotion:"move_high:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"L" toMotion:"move_low:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"M" toMotion:"move_middle:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"N" toMotion:"repeat_find_backward:")
(mmap setKey:"T" toMotion:"move_back_til_char:" flags:ViMapNeedArgument parameter:nil scope:nil)
(mmap setKey:"W" toMotion:"word_forward:")
(mmap setKey:"0" toMotion:"move_bol:")
(mmap setKey:"b" toMotion:"word_backward:")
(mmap setKey:"e" toMotion:"end_of_word:")
(mmap setKey:"f" toMotion:"move_to_char:" flags:ViMapNeedArgument parameter:nil scope:nil)
(mmap setKey:"gg" toMotion:"goto_line:" flags:ViMapLineMode parameter:NO scope:nil)
(mmap setKey:"gj" toMotion:"move_down_soft:")
(mmap setKey:"gk" toMotion:"move_up_soft:")
(mmap setKey:"h" toMotion:"move_left:")
(mmap setKey:"j" toMotion:"move_down:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"k" toMotion:"move_up:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"l" toMotion:"move_right:")
(mmap setKey:"n" toMotion:"repeat_find:")
(mmap setKey:"t" toMotion:"move_til_char:" flags:ViMapNeedArgument parameter:nil scope:nil)
(mmap setKey:"w" toMotion:"word_forward:")
(mmap setKey:"$" toMotion:"move_eol:")
(mmap setKey:"_" toMotion:"move_down_bol2:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"+" toMotion:"move_down_bol:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"-" toMotion:"move_up_bol:" flags:ViMapLineMode parameter:nil scope:nil)
(mmap setKey:"^" toMotion:"move_first_char:")
(mmap setKey:";" toMotion:"repeat_line_search_forward:")
(mmap setKey:"," toMotion:"repeat_line_search_backward:")
(mmap setKey:"/" toMotion:"find:")
(mmap setKey:"?" toMotion:"find_backwards:")
(mmap setKey:"#" toMotion:"find_current_word_backward:")
(mmap setKey:"*" toMotion:"find_current_word_forward:")
(mmap setKey:"}" toMotion:"paragraph_forward:")
(mmap setKey:"{" toMotion:"paragraph_backward:")
(mmap setKey:"%" toMotion:"move_to_match:")
(mmap setKey:"'" toMotion:"move_to_mark:" flags:(| ViMapNeedArgument ViMapLineMode) parameter:nil scope:nil)
(mmap setKey:"`" toMotion:"move_to_mark:" flags:ViMapNeedArgument parameter:nil scope:nil)
(mmap setKey:"g'" toMotion:"move_to_mark:" flags:(| ViMapNeedArgument ViMapLineMode) parameter:nil scope:nil)
(mmap setKey:"g`" toMotion:"move_to_mark:" flags:ViMapNeedArgument parameter:nil scope:nil)


;; text objects in operator and visual maps
(tmap setKey:"iw" toMotion:"select_inner_word:")
(tmap setKey:"aw" toMotion:"select_outer_word:")
(tmap setKey:"iW" toMotion:"select_inner_bigword:")
(tmap setKey:"aW" toMotion:"select_outer_bigword:")
(tmap setKey:"ip" toMotion:"select_inner_paragraph:")
(tmap setKey:"ap" toMotion:"select_outer_paragraph:")
(tmap setKey:"i\"" toMotion:"select_inner_string:")
(tmap setKey:"i\'" toMotion:"select_inner_string:")
(tmap setKey:"i\`" toMotion:"select_inner_string:")
(tmap setKey:"a\"" toMotion:"select_outer_string:")
(tmap setKey:"a\'" toMotion:"select_outer_string:")
(tmap setKey:"a\`" toMotion:"select_outer_string:")
(tmap setKey:"iS" toMotion:"select_inner_scope:")
(tmap setKey:"i(" toMotion:"select_inner_block:")
(tmap setKey:"i)" toMotion:"select_inner_block:")
(tmap setKey:"ib" toMotion:"select_inner_block:")
(tmap setKey:"a(" toMotion:"select_outer_block:")
(tmap setKey:"a)" toMotion:"select_outer_block:")
(tmap setKey:"ab" toMotion:"select_outer_block:")
(tmap setKey:"i{" toMotion:"select_inner_brace:")
(tmap setKey:"i}" toMotion:"select_inner_brace:")
(tmap setKey:"iB" toMotion:"select_inner_brace:")
(tmap setKey:"a{" toMotion:"select_outer_brace:")
(tmap setKey:"a}" toMotion:"select_outer_brace:")
(tmap setKey:"aB" toMotion:"select_outer_brace:")
(tmap setKey:"i[" toMotion:"select_inner_bracket:")
(tmap setKey:"i]" toMotion:"select_inner_bracket:")
(tmap setKey:"a[" toMotion:"select_outer_bracket:")
(tmap setKey:"a]" toMotion:"select_outer_bracket:")
(tmap setKey:"i<" toMotion:"select_inner_angle_bracket:")
(tmap setKey:"i>" toMotion:"select_inner_angle_bracket:")
(tmap setKey:"a<" toMotion:"select_outer_angle_bracket:")
(tmap setKey:"a>" toMotion:"select_outer_angle_bracket:")


;; c-w prefix map for managing split views
(wmap setKey:"<c-w><c-h>" toAction:"window_left:")
(wmap setKey:"<c-w><c-j>" toAction:"window_down:")
(wmap setKey:"<c-w><c-k>" toAction:"window_up:")
(wmap setKey:"<c-w><c-l>" toAction:"window_right:")
(wmap setKey:"<c-w><c-n>" toAction:"window_new:")
(wmap setKey:"<c-w>T" toAction:"window_totab:")
(wmap setKey:"<c-w>D" toAction:"window_towindow:")
(wmap setKey:"<c-w>c" toAction:"window_close:")
(wmap setKey:"<c-w><c-c>" toAction:"window_close:")
(wmap setKey:"<c-w>h" toAction:"window_left:")
(wmap setKey:"<c-w>j" toAction:"window_down:")
(wmap setKey:"<c-w>k" toAction:"window_up:")
(wmap setKey:"<c-w>l" toAction:"window_right:")
(wmap setKey:"<c-w>n" toAction:"window_new:")
(wmap setKey:"<c-w>o" toAction:"window_only:")
(wmap setKey:"<c-w>s" toAction:"window_split:")
(wmap setKey:"<c-w>S" toAction:"window_split:")
(wmap setKey:"<c-w><c-s>" toAction:"window_split:")
(wmap setKey:"<c-w>v" toAction:"window_vsplit:")
(wmap setKey:"<c-w><c-v>" toAction:"window_vsplit:")
(wmap setKey:"<c-w>p" toAction:"window_last:")
(wmap setKey:"<c-w><c-p>" toAction:"window_last:")
(wmap setKey:"<c-w>w" toAction:"window_next:")
(wmap setKey:"<c-w><c-w>" toAction:"window_next:")
(wmap setKey:"<c-w>W" toAction:"window_previous:")
;(wmap setKey:"<c-W><c-W>" toAction:"window_previous:")
(wmap setKey:"<c-w>=" toAction:"window_normalize:")
(wmap setKey:"<c-w><left>" toAction:"window_left:")
(wmap setKey:"<c-w><down>" toAction:"window_down:")
(wmap setKey:"<c-w><up>" toAction:"window_up:")
(wmap setKey:"<c-w><right>" toAction:"window_right:")


;; normal map
(nmap setOperatorMap:(ViMap operatorMap))
(nmap include:gmap)
(nmap include:mmap)
;(nmap setKey:"<c-a>" toEditAction:"increment:")
;(nmap setKey:"<c-x>" toEditAction:"decrement:")
(nmap setKey:"<c-b>" toMotion:"backward_screen:")
(nmap setKey:"<c-f>" toMotion:"forward_screen:")
(nmap setKey:"<c-d>" toAction:"scroll_downward:")
(nmap setKey:"<c-e>" toAction:"scroll_down_by_line:")
(nmap setKey:"<c-i>" toAction:"jumplist_forward:")
(nmap setKey:"<c-o>" toAction:"jumplist_backward:")
(nmap setKey:"<c-g>" toAction:"show_info:")
(nmap setKey:"<c-r>" toAction:"vim_redo:")
(nmap setKey:"<c-t>" toAction:"pop_tag:")
(nmap setKey:"<c-u>" toAction:"scroll_upwards:")
(nmap setKey:"<c-y>" toAction:"scroll_up_by_line:")
(nmap setKey:"<esc>" toAction:"normal_mode:")
(nmap setKey:"<c-]>" toAction:"jump_tag:")
(nmap setKey:"<c-^>" toAction:"switch_file:")
(nmap setKey:"<c-6>" toAction:"switch_file:")
(nmap setKey:"A" toEditAction:"append_eol:")
(nmap setKey:"C" toEditAction:"change_eol:")
(nmap setKey:"D" toEditAction:"delete_eol:")
(nmap setKey:"I" toEditAction:"insert_bol:")
(nmap setKey:"J" toEditAction:"join:")
(nmap setKey:"O" toEditAction:"open_line_above:")
(nmap setKey:"P" toEditAction:"put_before:")
(nmap setKey:"S" toEditAction:"subst_lines:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"V" toAction:"visual_line:")
(nmap setKey:"X" toEditAction:"delete_backward:")
(nmap setKey:"Y" toAction:"yank:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"a" toEditAction:"append:")
(nmap setKey:"c" toOperator:"change:")
(nmap setKey:"cc" toEditAction:"subst_lines:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"d" toOperator:"delete:")
(nmap setKey:"i" toEditAction:"insert:")
(nmap setKey:"m" toAction:"set_mark:" flags:ViMapNeedArgument parameter:nil scope:nil)
(nmap setKey:"o" toEditAction:"open_line_below:")
(nmap setKey:"p" toEditAction:"put_after:")
(nmap setKey:"r" toEditAction:"replace:" flags:ViMapNeedArgument parameter:nil scope:nil)
(nmap setKey:"r<ctrl-v>" toEditAction:"replace_literal:" flags:ViMapNeedArgument parameter:nil scope:nil)
(nmap setKey:"s" toEditAction:"substitute:")
(nmap setKey:"u" toAction:"vi_undo:")
(nmap setKey:"v" toAction:"visual:")
(nmap setKey:"x" toEditAction:"delete_forward:")
(nmap setKey:"y" toAction:"yank:" flags:ViMapNeedMotion parameter:nil scope:nil)
(nmap setKey:"=" toOperator:"indent:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:":" toAction:"ex_command:")
(nmap setKey:">" toOperator:"shift_right:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"<" toOperator:"shift_left:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"!" toOperator:"filter:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"." toAction:"dot:")
(nmap setKey:"~" toEditAction:"toggle_case:")
(nmap setKey:"@" toAction:"execute_register:" flags:ViMapNeedArgument parameter:nil scope:nil)
(nmap setKey:"<delete>" toEditAction:"delete_forward:")
;(nmap setKey:"<cmd-+>" toAction:"increase_fontsize:")
;(nmap setKey:"<cmd-->" toAction:"decrease_fontsize:")
(nmap setKey:"<cmd-z>" toAction:"undo:")
(nmap setKey:"<cmd-Z>" toAction:"redo:")
;; <C-w> prefix
(nmap include:wmap)
;; g prefix
(nmap setKey:"gi" toEditAction:"vi_gi:")
(nmap setKey:"gv" toEditAction:"vi_gv:")
(nmap setKey:"gU" toOperator:"uppercase:")
(nmap setKey:"gUgU" toEditAction:"uppercase:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"gu" toOperator:"lowercase:")
(nmap setKey:"gugu" toEditAction:"lowercase:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"g~" toOperator:"toggle_case_op:")
(nmap setKey:"g~g~" toEditAction:"toggle_case_op:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"gt" toAction:"next_tab:")
(nmap setKey:"gT" toAction:"previous_tab:")
(nmap setKey:"gq" toOperator:"format:" flags:ViMapLineMode parameter:nil scope:nil)
(nmap setKey:"gqgq" toEditAction:"format:" flags:ViMapLineMode parameter:nil scope:nil)
;; z prefix
(nmap setKey:"zt" toAction:"reposition_top:")
(nmap setKey:"z<cr>" toAction:"reposition_top_bol:")
(nmap setKey:"zb" toAction:"reposition_bottom:")
(nmap setKey:"z-" toAction:"reposition_bottom_bol:")
(nmap setKey:"zz" toAction:"reposition_middle:")
(nmap setKey:"z." toAction:"reposition_middle_bol:")

(nmap map:"ZZ" to:":xit<cr>")
(nmap map:"ZQ" to:":q!<cr>")


;; operator map
(omap include:mmap)
(omap include:tmap)
(omap setKey:"vj" toMotion:"move_down:")
(omap setKey:"vk" toMotion:"move_up:")



;; visual map
(vmap include:gmap)
(vmap include:tmap)
(vmap include:mmap)
(vmap include:wmap)
;; <bs> is already bound to move_left in motionMap (included above),
;; but mappings in included maps are overridden in the "calling" map.
(vmap setKey:"<bs>" toEditAction:"delete:")
(vmap setKey:"<del>" toEditAction:"delete:")
(vmap setKey:"C" toEditAction:"change:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:"D" toEditAction:"delete:")
(vmap setKey:"P" toEditAction:"put_before:")
(vmap setKey:"S" toEditAction:"subst_lines:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:"U" toEditAction:"uppercase:")
(vmap setKey:"V" toAction:"visual_line:")
(vmap setKey:"X" toEditAction:"delete:")
(vmap setKey:"Y" toAction:"yank:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:"c" toEditAction:"change:")
(vmap setKey:"d" toEditAction:"delete:")
(vmap setKey:"gU" toEditAction:"uppercase:")
(vmap setKey:"gu" toEditAction:"lowercase:")
(vmap setKey:"g~" toEditAction:"toggle_case_op:")
(vmap setKey:"gt" toAction:"next_tab:")
(vmap setKey:"gT" toAction:"previous_tab:")
(vmap setKey:"gq" toEditAction:"format:")
(vmap setKey:"o" toEditAction:"visual_other:")
(vmap setKey:"p" toEditAction:"put_after:")
(vmap setKey:"r" toEditAction:"replace:" flags:ViMapNeedArgument parameter:nil scope:nil)
(vmap setKey:"s" toEditAction:"substitute:")
(vmap setKey:"u" toEditAction:"lowercase:")
(vmap setKey:"v" toAction:"visual:")
(vmap setKey:"x" toEditAction:"delete:")
(vmap setKey:"y" toAction:"yank:")
(vmap setKey:"<" toEditAction:"shift_left:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:">" toEditAction:"shift_right:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:"!" toEditAction:"filter:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:"=" toEditAction:"indent:" flags:ViMapLineMode parameter:nil scope:nil)
(vmap setKey:":" toAction:"ex_command:")
(vmap setKey:"~" toEditAction:"toggle_case_op:")
(vmap setKey:"<esc>" toAction:"normal_mode:")
(vmap setKey:"<c-b>" toMotion:"backward_screen:")
(vmap setKey:"<c-d>" toMotion:"scroll_downward:")
(vmap setKey:"<c-e>" toMotion:"scroll_down_by_line:")
(vmap setKey:"<c-f>" toMotion:"forward_screen:")
(vmap setKey:"<c-u>" toMotion:"scroll_upwards:")
(vmap setKey:"<c-y>" toMotion:"scroll_up_by_line:")


;; command HTML output map
(webmap setOperatorMap:(ViMap operatorMap))
(webmap include:(ViMap normalMap))

;; navigation map for tables
(tabmap setKey:"<down>" toMotion:"move_down:")
(tabmap setKey:"<up>" toMotion:"move_up:")
(tabmap setKey:"<left>" toMotion:"move_left:")
(tabmap setKey:"<right>" toMotion:"move_right:")
(tabmap setKey:"<c-b>" toMotion:"backward_screen:")
(tabmap setKey:"<pageup>" toMotion:"backward_screen:")
(tabmap setKey:"<c-d>" toAction:"scroll_downward:")
(tabmap setKey:"<c-e>" toAction:"scroll_down_by_line:")
(tabmap setKey:"<c-f>" toMotion:"forward_screen:")
(tabmap setKey:"<pagedown>" toMotion:"forward_screen:")
(tabmap setKey:"<c-h>" toMotion:"move_left:")
(tabmap setKey:"<c-u>" toAction:"scroll_upwards:")
(tabmap setKey:"<c-y>" toAction:"scroll_up_by_line:")
(tabmap setKey:"G" toMotion:"goto_line:" flags:0 parameter:YES scope:nil)
(tabmap setKey:"H" toMotion:"move_high:")
(tabmap setKey:"L" toMotion:"move_low:")
(tabmap setKey:"M" toMotion:"move_middle:")
(tabmap setKey:"gg" toMotion:"goto_line:" flags:ViMapLineMode parameter:NO scope:nil)
(tabmap setKey:"h" toMotion:"move_left:")
(tabmap setKey:"j" toMotion:"move_down:")
(tabmap setKey:"k" toMotion:"move_up:")
(tabmap setKey:"l" toMotion:"move_right:")
(tabmap setKey:"<cr>" toMotion:"double_action:")

;; sidebar navigation map (valid for explorer and symbol map)
(sidemap include:gmap)
(sidemap include:tabmap)
(sidemap setKey:"/" toMotion:"find:")
(sidemap setKey:"<esc>" toAction:"cancel:")
(sidemap setKey:"<ctrl-c>" toAction:"cancel_or_reset:")
(sidemap setKey:"o" toAction:"switch_open:")
(sidemap setKey:"s" toAction:"split_open:")
(sidemap setKey:"t" toAction:"tab_open:")
(sidemap setKey:"v" toAction:"vsplit_open:")
(sidemap setKey:"<cr>" toAction:"open:")
(sidemap setKey:"<alt-up>" toMotion:"goto_line:" flags:ViMapLineMode parameter:NO scope:nil)
(sidemap setKey:"<alt-down>" toMotion:"goto_line:" flags:ViMapLineMode parameter:YES scope:nil)

;; explorer map
(emap include:sidemap)
(emap setKey:"<c-l>" toAction:"rescan_files:")
(emap setKey:"N" toAction:"new_folder:")
(emap setKey:"dd" toAction:"remove_files:")
(emap setKey:"<cmd-bs>" toAction:"remove_files:")
(emap setKey:"n" toAction:"new_document:")
(emap setKey:"r" toAction:"rename_file:")
(emap setKey:"<ctrl-esc>" toMotion:"show_menu:")
(emap setKey:"<cmd-esc>" toMotion:"show_menu:")
(emap setKey:"<ctrl-i>" toAction:"jumplist_forward:")
(emap setKey:"<ctrl-o>" toAction:"jumplist_backward:")
(emap map:"<cmd-up>" toExpression:(do ()
	((current-explorer) browseURL:(((current-window) baseURL) URLByDeletingLastPathComponent))))
(emap map:"<cmd-D>" toExpression:(do ()
	((current-explorer) browseURL:(NSURL fileURLWithPath:("~/Desktop" stringByExpandingTildeInPath)))))
(emap map:"<cmd-H>" toExpression:(do ()
	((current-explorer) browseURL:(NSURL fileURLWithPath:("~" stringByExpandingTildeInPath)))))
(emap map:"<cmd-down>" to:"<cr>")

;; symbol map
(smap include:sidemap)

;; ex command line text field map
(xmap setDefaultAction:"input_character:")
(xmap setAcceptsCounts:NO) ; Don't treat numbers as command counts
(xmap setKey:"<esc>" toAction:"ex_cancel:")
(xmap setKey:"<ctrl-c>" toAction:"ex_cancel:")
(xmap setKey:"<cr>" toAction:"ex_execute:")
(xmap setKey:"<bs>" toAction:"input_backspace:")
(xmap setKey:"<Del>" toAction:"input_forward_delete:")
(xmap setKey:"<c-j>" toAction:"ex_execute:")
(xmap setKey:"<c-m>" toAction:"ex_execute:")
(xmap setKey:"<c-u>" toAction:"delete_bol:")
(xmap setKey:"<c-w>" toAction:"delete_word:")
(xmap setKey:"<c-v>" toAction:"literal_next:" flags:ViMapNeedArgument parameter:nil scope:nil)
(xmap setKey:"<c-r>" toAction:"input_register:" flags:ViMapNeedArgument parameter:nil scope:nil)
(xmap map:"<cmd-v>" to:"<ctrl-r>*")
(xmap setKey:"<right>" toAction:"move_right:")
(xmap setKey:"<left>" toAction:"move_left:")
(xmap setKey:"<home>" toAction:"move_first_char:")
(xmap setKey:"<end>" toAction:"move_eol:")
(xmap setKey:"<ctrl-right>" toAction:"move_eol:")
(xmap setKey:"<ctrl-left>" toAction:"move_bol:")
(xmap setKey:"<cmd-right>" toAction:"move_eol:")
(xmap setKey:"<cmd-left>" toAction:"move_bol:")
(xmap setKey:"<down>" toAction:"next_history:")
(xmap setKey:"<up>" toAction:"prev_history:")
(xmap setKey:"<pagedown>" toAction:"next_history_ignoring_prefix:")
(xmap setKey:"<pageup>" toAction:"prev_history_ignoring_prefix:")
(xmap setKey:"<ctrl-d>" toAction:"ex_complete:" flags:0 parameter:"pa" scope:nil)
(xmap setKey:"<tab>" toAction:"ex_complete:" flags:0 parameter:"pa" scope:nil)
(xmap setKey:"<ctrl-f>" toAction:"ex_complete:" flags:0 parameter:"Ffpa" scope:nil)
;; Restore normal Mac OS X keyboard actions in insert mode.
(xmap setKey:"<alt-bs>" toAction:"deleteWordBackward:")
(xmap setKey:"<alt-del>" toAction:"deleteWordForward:")
(xmap setKey:"<alt-left>" toAction:"moveWordLeft:")
(xmap setKey:"<alt-right>" toAction:"moveWordRight:")


;; a map for the completion list, similar to vim's ctrl-x mode
(cmap setAcceptsCounts:NO) ; Don't treat numbers as command counts
(cmap setDefaultAction:"filter:")
(cmap setKey:"<esc>" toAction:"cancel:")
(cmap setKey:"<ctrl-e>" toAction:"cancel:")
(cmap setKey:"<cr>" toAction:"accept:")
(cmap setKey:"<tab>" toAction:"accept_or_complete_partially:")
(cmap setKey:"<space>" toAction:"accept:")
(cmap setKey:"<ctrl-y>" toAction:"accept:")
(cmap setKey:"<ctrl-n>" toAction:"move_down:")
(cmap setKey:"<ctrl-j>" toAction:"move_down:")
(cmap setKey:"<ctrl-k>" toAction:"move_up:")
(cmap setKey:"<ctrl-p>" toAction:"move_up:")
(cmap setKey:"<down>" toAction:"move_down:")
(cmap setKey:"<up>" toAction:"move_up:")
(cmap setKey:"<ctrl-f>" toAction:"toggle_fuzzy:")


;; visual selection with shift + arrow keys
(imap map:"<shift-left>" to:"<esc>v<left>")
(imap map:"<shift-up>" to:"<esc>v<up>")
(imap map:"<shift-pageup>" to:"<esc>v<pageup>")
(imap map:"<shift-home>" to:"<esc>v<home>")
(imap map:"<shift-alt-left>" to:"<esc>v<alt-left>")
(imap map:"<shift-alt-up>" to:"<esc>v<alt-up>")
(imap map:"<shift-ctrl-left>" to:"<esc>v<ctrl-left>")
(imap map:"<shift-cmd-left>" to:"<esc>v<cmd-left>")
(imap map:"<shift-cmd-up>" to:"<esc>v<cmd-up>")
(imap map:"<shift-right>" to:"<esc><right>v<right>")
(imap map:"<shift-alt-right>" to:"<esc><right>v<alt-right>")
(imap map:"<shift-ctrl-right>" to:"<esc><right>v<ctrl-right>")
(imap map:"<shift-cmd-right>" to:"<esc>v<cmd-right>")
(imap map:"<shift-cmd-down>" to:"<esc><right>v<cmd-down>")
(imap map:"<shift-down>" to:"<esc><right>v<down>")
(imap map:"<shift-pagedown>" to:"<esc><right>v<pagedown>")
(imap map:"<shift-end>" to:"<esc><right>v<end>")
(imap map:"<shift-alt-down>" to:"<esc><right>v<alt-down>")

(nmap map:"<shift-left>" to:"v<left>")
(nmap map:"<shift-right>" to:"v<right>")
(nmap map:"<shift-up>" to:"v<up>")
(nmap map:"<shift-down>" to:"v<down>")
(nmap map:"<shift-pageup>" to:"v<pageup>")
(nmap map:"<shift-pagedown>" to:"v<pagedown>")
(nmap map:"<shift-home>" to:"v<home>")
(nmap map:"<shift-end>" to:"v<end>")
(nmap map:"<shift-alt-left>" to:"v<alt-left>")
(nmap map:"<shift-alt-right>" to:"v<alt-right>")
(nmap map:"<shift-alt-up>" to:"v<alt-up>")
(nmap map:"<shift-alt-down>" to:"v<alt-down>")
(nmap map:"<shift-ctrl-left>" to:"v<ctrl-left>")
(nmap map:"<shift-ctrl-right>" to:"v<ctrl-right>")
(nmap map:"<shift-cmd-left>" to:"v<cmd-left>")
(nmap map:"<shift-cmd-right>" to:"v<cmd-right>")
(nmap map:"<shift-cmd-up>" to:"v<cmd-up>")
(nmap map:"<shift-cmd-down>" to:"v<cmd-down>")

(vmap map:"<shift-left>" to:"<left>")
(vmap map:"<shift-right>" to:"<right>")
(vmap map:"<shift-up>" to:"<up>")
(vmap map:"<shift-down>" to:"<down>")
(vmap map:"<shift-pageup>" to:"<pageup>")
(vmap map:"<shift-pagedown>" to:"<pagedown>")
(vmap map:"<shift-home>" to:"<home>")
(vmap map:"<shift-end>" to:"<end>")
(vmap map:"<shift-alt-left>" to:"<alt-left>")
(vmap map:"<shift-alt-right>" to:"<alt-right>")
(vmap map:"<shift-alt-up>" to:"<alt-up>")
(vmap map:"<shift-alt-down>" to:"<alt-down>")
(vmap map:"<shift-ctrl-left>" to:"<ctrl-left>")
(vmap map:"<shift-ctrl-right>" to:"<ctrl-right>")
(vmap map:"<shift-cmd-left>" to:"<cmd-left>")
(vmap map:"<shift-cmd-right>" to:"<cmd-right>")
(vmap map:"<shift-cmd-up>" to:"<cmd-up>")
(vmap map:"<shift-cmd-down>" to:"<cmd-down>")



; insert newline above current line
((ViMap insertMap) map:"<ctrl-k>" to:"<esc>O")

; move to EOL and insert statement terminator
((ViMap insertMap) map:"<alt-cmd-cr>" toExpression:(do ()
	(let (term (or (((current-text) environment) objectForKey:"TM_LINE_TERMINATOR") ";"))
		((current-text) input:"<esc>A#{term}"))))
; move to EOL and insert statement terminator + newline
((ViMap insertMap) map:"<shift-cmd-cr>" to:"<alt-cmd-cr><esc>o" recursively:YES scope:nil)

; switch buffer, w/fuzzy completion
((ViMap normalMap) map:"<ctrl-s>" toExpression:(do ()
	(if ((user-defaults) boolForKey:"prefertabs")
		; if we prefer documents in tabs, switch to an open tab, or open a new tab
		((current-text) input:":tbuffer <ctrl-f>")
		(else
			; we prefer to open documents in the same view
			((current-text) input:":buffer <ctrl-f>"))) ))

; macros are not recursive by default (this will just shift j and k)
;(nmap map:"j" to:"k")
;(nmap map:"k" to:"j")

; recursive macros:
;(nmap map:"h" to:"l" recursively:YES scope:nil)
;(nmap map:"l" to:"h" recursively:YES scope:nil)
; this will cause unbound recursion and will abort after 1000 iterations

)
