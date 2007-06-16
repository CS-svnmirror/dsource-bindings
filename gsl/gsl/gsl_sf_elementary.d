/* Converted to D from gsl_sf_elementary.h by htod
 * and edited by daniel truemper <truemped.dsource <with> hence22.org>
 */
module gsl.gsl_sf_elementary;
/* specfunc/gsl_sf_elementary.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/* Author:  G. Jungman */

/* Miscellaneous elementary functions and operations.
 */

public import gsl.gsl_sf_result;

/* Multiplication.
 *
 * exceptions: GSL_EOVRFLW, GSL_EUNDRFLW
 */

extern (C):
int  gsl_sf_multiply_e(double x, double y, gsl_sf_result *result);

double  gsl_sf_multiply(double x, double y);

/* Multiplication of quantities with associated errors.
 */

int  gsl_sf_multiply_err_e(double x, double dx, double y, double dy, gsl_sf_result *result);

