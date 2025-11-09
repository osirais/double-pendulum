open Graphics

let () =
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
  close_graph ();