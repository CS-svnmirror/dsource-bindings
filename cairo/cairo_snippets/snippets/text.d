
module snippets.text;

private
{
    import std.math;
    import cairo.cairo;
    import snippets.common;
}

void snippet_text(cairo_t* cr, int width, int height)
{
    cairo_select_font_face (cr, "Sans",
            cairo_font_slant_t.CAIRO_FONT_SLANT_NORMAL,
            cairo_font_weight_t.CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size (cr, 0.35);

    cairo_move_to (cr, 0.04, 0.53);
    cairo_show_text (cr, "Hello");

    cairo_move_to (cr, 0.27, 0.65);
    cairo_text_path (cr, "void");
    cairo_set_source_rgb (cr, 0.5, 0.5, 1);
    cairo_fill_preserve (cr);
    cairo_set_source_rgb (cr, 0, 0, 0);
    cairo_set_line_width (cr, 0.01);
    cairo_stroke (cr);

    /* draw helping lines */
    cairo_set_source_rgba (cr, 1,0.2,0.2, 0.6);
    cairo_arc (cr, 0.04, 0.53, 0.02, 0, 2*PI);
    cairo_arc (cr, 0.27, 0.65, 0.02, 0, 2*PI);
    cairo_fill (cr);
}

static this()
{
    snippets_hash["text"] = &snippet_text;
}

