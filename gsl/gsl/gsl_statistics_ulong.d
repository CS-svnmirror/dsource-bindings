/* Converted to D from gsl_statistics_ulong.h by htod
 * and edited by daniel truemper <truemped.dsource <with> hence22.org>
 */
module gsl.gsl_statistics_ulong;
/* statistics/gsl_statistics_ulong.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Jim Davies, Brian Gough
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

import tango.stdc.stddef;

extern (C):
double  gsl_stats_ulong_mean(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_variance(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_sd(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_variance_with_fixed_mean(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_sd_with_fixed_mean(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_absdev(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_skew(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_kurtosis(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_lag1_autocorrelation(uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_covariance(uint *data1, size_t stride1, uint *data2, size_t stride2, size_t n);

double  gsl_stats_ulong_variance_m(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_sd_m(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_absdev_m(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_skew_m_sd(uint *data, size_t stride, size_t n, double mean, double sd);

double  gsl_stats_ulong_kurtosis_m_sd(uint *data, size_t stride, size_t n, double mean, double sd);

double  gsl_stats_ulong_lag1_autocorrelation_m(uint *data, size_t stride, size_t n, double mean);

double  gsl_stats_ulong_covariance_m(uint *data1, size_t stride1, uint *data2, size_t stride2, size_t n, double mean1, double mean2);

double  gsl_stats_ulong_pvariance(uint *data1, size_t stride1, size_t n1, uint *data2, size_t stride2, size_t n2);

double  gsl_stats_ulong_ttest(uint *data1, size_t stride1, size_t n1, uint *data2, size_t stride2, size_t n2);

uint  gsl_stats_ulong_max(uint *data, size_t stride, size_t n);

uint  gsl_stats_ulong_min(uint *data, size_t stride, size_t n);

void  gsl_stats_ulong_minmax(uint *min, uint *max, uint *data, size_t stride, size_t n);

size_t  gsl_stats_ulong_max_index(uint *data, size_t stride, size_t n);

size_t  gsl_stats_ulong_min_index(uint *data, size_t stride, size_t n);

void  gsl_stats_ulong_minmax_index(size_t *min_index, size_t *max_index, uint *data, size_t stride, size_t n);

double  gsl_stats_ulong_median_from_sorted_data(uint *sorted_data, size_t stride, size_t n);

double  gsl_stats_ulong_quantile_from_sorted_data(uint *sorted_data, size_t stride, size_t n, double f);

