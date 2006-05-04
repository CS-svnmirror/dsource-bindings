
module snippets.text_align_center;

private
{
    import std.math;
    import cairo.cairo;
    import snippets.common;
}

void snippet_text_align_center(cairo_t* cr, int width, int height)
{
    cairo_text_extents_t extents;

    char[] utf8 = "cairo";
    double x,y;

    cairo_select_font_face (cr, "Sans",
        cairo_font_slant_t.CAIRO_FONT_SLANT_NORMAL,
        cairo_font_weight_t.CAIRO_FONT_WEIGHT_NORMAL);

    cairo_set_font_size (cr, 0.2);
    cairo_text_extents (cr, utf8, &extents);
    x = 0.5-(extents.width/2 + extents.x_bearing);
    y = 0.5-(extents.height/2 + extents.y_bearing);

    cairo_move_to (cr, x, y);
    cairo_show_text (cr, utf8);

    /* draw helping lines */
    cairo_set_source_rgba (cr, 1,0.2,0.2, 0.6);
    cairo_arc (cr, x, y, 0.05, 0, 2*PI);
    cairo_fill (cr);
    cairo_move_to (cr, 0.5, 0);
    cairo_rel_line_to (cr, 0, 1);
    cairo_move_to (cr, 0, 0.5);
    cairo_rel_line_to (cr, 1, 0);
    cairo_stroke (cr);
}

static this()
{
    snippets_hash["text_align_center"] = &snippet_text_align_center;
}

