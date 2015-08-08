open Assert
open X86
open Interpreter

(* Test suite for hellocaml.ml *)

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your project.                   *)

(* These tests will be used to grade your assignment *)

let run_test (ans:int32) (code:X86.insn_block list) () =
  let res = Interpreter.run code in
    if res = ans then () else failwith (Printf.sprintf("Expected %lx got %lx") ans res)

let assert_bool (s:string) (b:bool) : unit =
  if b then () else failwith s

let map_addr_test =
  let test_sf addr () =
    try ignore (map_addr addr); 
      failwith "Should have raised X86_segmentation_fault"
    with 
      |	X86_segmentation_fault _ -> () 
      | _ -> failwith "Should have raised X86_segmentation_fault"
  in
  GradedTest("map_addr", 5,
	     [("map_addr1", assert_eqf (fun () -> map_addr 0xfffffffcl) 1023);
	      ("map_addr2", assert_eqf (fun () -> map_addr 0xfffff000l) 0);
	      ("map_addr3", assert_eqf (fun () -> map_addr 0xffffff08l) 962);
	      ("map_addr4", test_sf 0x00000000l);
	      ("map_addr5", test_sf 0xfffffffdl);])

let cnd_code_test = 
  let st = mk_init_state () in
  let ccs (fof,fsf,fzf) tru () =
    st.s_OF <- fof; st.s_SF <- fsf; st.s_ZF <- fzf;
    let allcc = [Eq;NotEq;Zero;NotZero;Sgt;Sle;Slt;Sge] in
    let fls = List.filter (fun i -> not (List.mem i tru)) allcc in
      List.iter (fun cc ->
		   assert_bool (Printf.sprintf "o:%b s:%b f:%b %s expected" fof fsf fzf
				  (string_of_cnd cc)) (condition_matches st cc)) tru;
      List.iter (fun cc ->
		   assert_bool (Printf.sprintf "o:%b s:%b f:%b %s !expected" fof fsf fzf
				  (string_of_cnd cc)) (not (condition_matches st cc))) fls
  in
    GradedTest("Condition Codes", 5,
	       [("ccs0", ccs (false,false,false) [NotEq;NotZero;Sgt;Sge]);
		("ccs1", ccs (false,false,true) [Eq;Zero;Sle;Sge]);
		("ccs2", ccs (false,true ,false) [NotEq;NotZero;Sle;Slt]);
		("ccs3", ccs (false,true ,true) [Eq;Zero;Sle;Slt]);])


let st_test (s:string) (code:insn_block list) (f:x86_state -> bool) () =
  let st = mk_init_state () in
  let _ = interpret code st (mk_lbl_named "main") in
    if (f st) then () else failwith ("expected " ^ s)

let cc_test (s:string) (fof, fsf, fzf) (code:insn_block list) (f:x86_state -> bool) () =
  let st = {(mk_init_state ()) with s_OF = fof; s_SF = fsf; s_ZF = fzf} in
  let _ = interpret code st (mk_lbl_named "main") in
    if (f st) then () else failwith ("expected " ^ s)

let cs_test block (eof,esf,ezf) =
  cc_test (Printf.sprintf "expected OF:%b SF:%b ZF:%b" eof esf ezf)
    (not eof,not esf,not ezf) block
    (fun st -> st.s_OF = eof && st.s_SF = esf && st.s_ZF = ezf)
    
let cso_test mbbs eof =
  cc_test (Printf.sprintf "expected OF:%b" eof) (not eof,false,false) mbbs
    (fun st -> st.s_OF = eof)

let csi_test mbbs =
  cc_test "expected TTT ccodes" 
    (true,true,true) mbbs
    (fun st -> st.s_OF && st.s_SF && st.s_ZF)

let factorial_test =  
  GradedTest("Factorial", 10, 
   [("fact 4", run_test 24l
    [(mk_insn_block (mk_lbl_named "fact") [
      Push (ebp);
      Mov (ebp, esp);
      Mov (eax, (stack_offset 8l));
      Cmp (eax, Imm 0l);
      J (Sgt, (mk_lbl_named "fact_recurse"));
      Mov (eax, Imm 1l);
      Pop (ebp);
      Ret
    ]); 
     (mk_insn_block (mk_lbl_named "fact_recurse") [
      Sub (eax, Imm 1l);
      Push (eax);
      Call (Lbl (mk_lbl_named "fact"));
      Add (esp, (Imm 4l));
      Mov (ebx, (stack_offset 8l));
      Imul (Eax, ebx);
      Pop (ebp);
      Ret
    ]); 
     (mk_insn_block (mk_lbl_named "main") [
      Push (Imm 4l);
      Call (Lbl (mk_lbl_named "fact"));
      Add (esp, (Imm 4l));
      Ret
    ]);]
   )])

let fun_tests = 
  GradedTest("FunctionalityTests", 5,
  [("mov_ri",  
    st_test "eax=42" 
      [(mk_block "main" [
	  Mov (eax, Imm 42l);
	  Ret;
	])] 
      (fun state -> state.s_reg.(0) = 42l));


  ("add", 
   st_test "eax=ebx=*1023=1" 
     [(mk_block "main" [
	 Add (eax, Imm 1l);
	 Add (ebx, eax);
	 Add (stack_offset 0l, ebx);
	 Ret;
       ])] 
     (fun state -> 
	state.s_reg.(0) = 1l &&
        state.s_reg.(1) = 1l && 
	state.s_mem.(mem_size-1) = 1l));

  ])

let insn_tests = 
  GradedTest("InstructionTests", 15, [
  ("mov_mr", st_test "*1022=42" [(mk_block "main"  [
      Mov (eax, Imm 42l);
      Mov (stack_offset (-4l), eax);
      Ret
    ])] 
     (fun state -> state.s_mem.(mem_size-2) = 42l)); 

  ("sub", st_test "eax=*1023=-1; ebx=1" [(mk_block "main"  [
      Sub (eax, Imm 1l);
      Sub (ebx, eax);
      Sub (stack_offset 0l, ebx);
      Ret;
    ])] 
     (fun state -> state.s_reg.(0) = -1l &&
        state.s_reg.(1) = 1l && state.s_mem.(mem_size-1) = -1l));

  ("and", st_test "eax=2 ebx=2 ecx=1 *1023=1" [(mk_block "main"  [
      Mov (eax, Imm 2l);
      Mov (ebx, Imm 3l);
      Mov (ecx, Imm 255l);
      Mov (stack_offset 0l, Imm 1l);
      And (eax, eax);
      And (eax, Imm 2l);
      And (ebx, eax);
      And (ecx, stack_offset 0l);
      Ret;
    ])] 
     (fun state ->
        state.s_reg.(0) = 2l &&
        state.s_reg.(1) = 2l &&
        state.s_reg.(2) = 1l &&
        state.s_mem.(mem_size-1) = 1l));

  ("neg", st_test "eax=-42 ebx=min_int32 *1023=24" [(mk_block "main"  [
      Mov (eax, Imm 42l);
      Mov (stack_offset 0l, Imm (-24l));
      Mov (ebx, Imm Int32.min_int);
      Neg eax;
      Neg (stack_offset 0l);
      Neg ebx;
      Ret;
    ])] 
     (fun state ->
        state.s_reg.(0) = (-42l) &&
        state.s_reg.(1) = Int32.min_int &&
        state.s_mem.(mem_size-1) = 24l
        ));

  ("shl", st_test "eax = 4; *1023 = 16" [(mk_block "main"  [
      Mov (eax, Imm 1l);
      Mov (stack_offset 0l, Imm 2l);
      Mov (ecx, Imm 3l);
      Shl (eax, Imm 2l);
      Shl (stack_offset 0l, ecx);
      Ret;
    ])] 
     (fun state ->
        state.s_reg.(0) = 4l &&
        state.s_mem.(mem_size-1) = 16l
        ));

  ("imul", st_test "eax=44" [(mk_block "main"  [
      Mov (eax, Imm 2l);
      Mov (ebx, Imm 22l);
      Imul (Eax, ebx);
      Ret;
    ])] 
     (fun state -> state.s_reg.(0) = 44l))        ;

  ("push", st_test "esp-4; s_mem.(1022)=2a" [(mk_block "main"  [
					   Push (Imm 42l);
					   Ret;
    ])] 
     (fun state -> state.s_reg.(7) = 0xFFFFFFFCl &&
        state.s_mem.(mem_size-2) = 0x2Al));

  ("pop", st_test "esp; eax=2a" [(mk_block "main"  [
      Add (esp, Imm (-8l));
      Mov (stack_offset 0l, Imm (42l));
      Pop (eax);
      Ret;
    ])] 
     (fun state -> state.s_reg.(0) = 0x2al &&
        state.s_reg.(7) = 0xFFFFFFFCl));

  ("cmp", st_test "eax=4 ebx=0 *1023=2" [(mk_block "main"  [
      Mov (eax, Imm 4l);
      Mov (stack_offset 0l, Imm 2l);
      Cmp (eax, Imm 1l);
      Cmp (ebx, eax);
      Cmp (stack_offset 0l, ebx);
      Ret;
    ])] 
     (fun state -> state.s_reg.(0) = 4l &&
        state.s_reg.(1) = 0l && state.s_mem.(mem_size-1) = 2l))        ;

	     ])


let cnd_set_tests =
  GradedTest("ConditionFlagSetTests", 10, [
  ("cc_add_1", cs_test [(mk_block "main" [
      Mov (eax, Imm 0xFFFFFFFFl);
      Add (eax, Imm 1l);
      Ret;
    ])] (false, false, true));

  ("cc_add_2", cs_test [(mk_block "main" [
      Mov (eax, Imm 0xFFFFFFFFl);
      Add (eax, Imm 0xFFFFFFFFl);
      Ret;
    ])] (false, true, false));

  ("cc_add_3", cs_test [(mk_block "main" [
      Mov (eax, Imm 0x7FFFFFFFl);
      Add (eax, Imm 42l);
      Ret;
    ])] (true, true, false));

  ("cc_add_4", cs_test [(mk_block "main" [
      Mov (eax, Imm 0x90000000l);
      Add (eax, Imm 0xA0000000l);
      Ret;
    ])] (true, false, false));

  ("cc_neg_1", cs_test [(mk_block "main" [
      Mov (ebx, Imm (Int32.min_int));
      Neg (ebx);
      Ret;
    ])] (true, true, false));

  ("cc_neg_2", cs_test [(mk_block "main" [
      Mov (eax, Imm 1l);
      Neg (eax);
      Ret;
    ])] (false, true, false));

  ("cc_cmp_1", cs_test [(mk_block "main" [
        Mov (eax, Imm 0l);
        Cmp (eax, Imm 0x80000000l);
	Ret;
      ])] (true, true, false));

  ("cc_cmp_2", cs_test [(mk_block "main" [
        Mov (eax, Imm 0x80000000l);
        Cmp (eax, Imm 0l);
	Ret;
      ])] (false, true, false));

  ("cc_imul_1", cso_test [(mk_block "main" [
        Mov (eax, Imm (-1l));
        Imul (Eax, Imm (-1l));
	Ret;
      ])] false);

  ("cc_and", cs_test [(mk_block "main" [
      Mov (eax, Imm 0x0F0F0F0Fl);
      And (eax, Imm 0xF0F0F0F0l);
      Ret;
    ])] (false,false,true));

  ("cc_or", cs_test [(mk_block "main" [
      Mov (eax, Imm 0xFFFFFFFFl);
      Or (eax, Imm 0xF0F0F0F0l);
      Ret;
    ])] (false,true,false));

  ("csi_push", csi_test [(mk_block "main" [
      Push (Imm 0l);
      Ret;
    ])]);

  (* ("csi_pop", csi_test [(mk_block "main" [ *)
  (* 			   Pop (eax); *)
  (* 			   Ret; *)
  (*   ])]); *)

  ("csi_setb", csi_test [(mk_block "main" [
      Setb (eax, NotZero);
			    Ret;
    ])]);

  ("csi_jmp", csi_test [(mk_block "main" [
      Jmp (Lbl (mk_lbl_named "out"))
    ]); (mk_block "out" [
      Ret
    ])]);

  ("csi_call", csi_test [(mk_block "main" [
      Call (Lbl (mk_lbl_named "out"));
			    Ret;
    ]); (mk_block "out" [
      Ret
    ])]);

  ("csi_ret", csi_test [(mk_block "main" [
      Ret
    ])]);

  ("csi_js", csi_test [(mk_block "main" [
      J (NotZero, mk_lbl_named "out");
      Ret;
    ]); (mk_block "out" [
      Ret
    ])]);

  ("csi_jf", csi_test [(mk_block "main" [
      J (Zero, mk_lbl_named "out");
      Ret
    ]); (mk_block "out" [
      Ret
    ])]);

  ("csi_lea", csi_test [(mk_block "main" [
      Lea (Eax, {i_base = None; i_iscl = None; i_disp = Some (DImm 0l)});
			   Ret;
    ])]);

  ("csi_mov", csi_test [(mk_block "main" [
      Mov (eax, Imm 0l);
			   Ret;
    ])]);
	     ])




let other_team_tests = 
  GradedTest("OtherTeamTests", 10, [])


(*** Easy Tests ***)
let easy_tests : suite = [
  map_addr_test; cnd_code_test;
]

(*** Small Tests ***)
let medium_tests : suite = [
 fun_tests; insn_tests; cnd_set_tests; 
]

(*** Part 3 Tests ***)
let hard_tests : suite = [
  factorial_test; GradedTest("Hard", 10, [])
] @ [other_team_tests]



let manual_tests : suite = [
  GradedTest ("PartIITestCase", 20, [
  
  ]);
  GradedTest ("StyleManual", 10, [
  
  ]);
]

let graded_tests : suite = 
  easy_tests @
  medium_tests @
  hard_tests @
  manual_tests
