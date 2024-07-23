draw_set_font(comic);

draw_text_transformed(212, 82, string("Score: ") + string(global.score), 2, 2, 0);

draw_text_transformed(212, 35, string("State: ") + string(ob_player.state), 2, 2, 0);

draw_text_transformed(212, 135, string("HP: ") + string(global.hp), 2, 2, 0);

