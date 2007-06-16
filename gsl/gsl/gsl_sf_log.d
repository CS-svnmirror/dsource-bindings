/* Converted to D from gsl_sf_log.h by htod
 * and edited by daniel truemper <truemped.dsource <with> hence22.org>
 */
module gsl.gsl_sf_log;
/* specfunc/gsl_sf_log.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004 Gerard Jungman
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

public import gsl.gsl_sf_result;

/* Provide a logarithm function with GSL semantics.
 *
 * exceptions: GSL_EDOM
 */

extern (C):
int  gsl_sf_log_e(double x, gsl_sf_result *result);

double  gsl_sf_log(double x);

/* Log(|x|)
 *
 * exceptions: GSL_EDOM
 */

int  gsl_sf_log_abs_e(double x, gsl_sf_result *result);

double  gsl_sf_log_abs(double x);

/* Complex Logarithm
 *   exp(lnr + I theta) = zr + I zi
 * Returns argument in [-pi,pi].
 *
 * exceptions: GSL_EDOM
 */

int  gsl_sf_complex_log_e(double zr, double zi, gsl_sf_result *lnr, gsl_sf_result *theta);

/* Log(1 + x)
 *
 * exceptions: GSL_EDOM
 */

int  gsl_sf_log_1plusx_e(double x, gsl_sf_result *result);

double  gsl_sf_log_1plusx(double x);

/* Log(1 + x) - x
 *
 * exceptions: GSL_EDOM
 */

int  gsl_sf_log_1plusx_mx_e(double x, gsl_sf_result *result);

double  gsl_sf_log_1plusx_mx(double x);

  /* CHECK_POINTER(result) */

  /* CHECK_POINTER(result) */

