open Graphics

let rod_length = 100.0

let rod_width = 10.0

let rod_mass = 10.0

let rod_inertia = 0.5 *. rod_mass *. Float.pow rod_length 2.0

let gravity = -9.8

let dt = 0.01

let x0 = 10.0

let y0 = 20.0

let v0 = 0.0

let scale = 30.0

let floor_y = 10.0

let () =
  open_graph " 800x600";
  set_window_title "Simulation";

  set_color black;
  set_line_width 2000;

  let y = ref y0 in
  let v = ref v0 in
  let t = ref 0.0 in
  
  while !y >= 0.0 do
    v := !v +. gravity *. dt;
    y := !y +. !v *. dt;
    t := !t +. dt;

    if !y <= floor_y then (
      y := floor_y;
      v := -. !v *. 0.9;   (* reverse and lose some energy *)
    );

    clear_graph ();

    let screen_y = int_of_float (!y *. scale) in
    let screen_x = 400 in
    fill_circle screen_x screen_y 10;

    Unix.sleepf dt;
    Printf.printf "t=%.2f  y=%.3f  v=%.3f\n" !t !y !v;
  done;

  while true do
    Unix.sleepf 1.0;
  done;

  close_graph ();



(* let () =
  open_graph " 800x600";
  set_window_title "Draw";

  set_color red;
  fill_rect 100 100 200 150;

  set_color blue;
  fill_circle 400 300 80;

  for frame = 1 to 300000 do
    (* clear_graph (); *)
    set_color red;
    fill_rect (100 + frame) 100 200 150;
    (* if frame < 700 then resize_window (800 + frame) 600; *)
      plot (400 + int_of_float (50.0 *. sin (float frame /. 10.0))) 300;

    Unix.sleepf 0.01;
  done;

  ignore (wait_next_event [Button_down]);
  close_graph (); *)