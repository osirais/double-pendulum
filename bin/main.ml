open Graphics

let () =
  open_graph " 800x600";
  set_window_title "Draw";

  set_color red;
  fill_rect 100 100 200 150;

  set_color blue;
  fill_circle 400 300 80;

  ignore (wait_next_event [Button_down]);
  close_graph ();