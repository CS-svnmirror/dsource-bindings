/**
    XXX
    
Authors: Daniel Keep
Copyright: 2006, Daniel Keep
License: BSD v2 (http://opensource.org/licenses/bsd-license.php).
**/
/**
    Copyright © 2006 Daniel Keep
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:
    
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
      
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    
    * Neither the name of this software, nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/
module cairooo.radialgradient;

private
{
    import cairo.cairo;
    import cairooo.enums;
    import cairooo.exceptions;
    import cairooo.gradient;
}

class RadialGradient : Gradient
{
    this(cairo_pattern_t* handle, bool takeref)
    {
        super(handle, takeref);
    }

    this(RadialGradient radialGradient)
    {
        this(radialGradient.handle, true);
    }

    //
    // cairo api members
    //
    static
    RadialGradient
    create(double cx0, double cy0, double radius0,
            double cx1, double cy1, double radius1)
    {
        return new RadialGradient(
                cairo_pattern_create_radial(cx0, cy0, radius0,
                    cx1, cy1, radius1), false);
    }

    //
    // miscellaneous members
    //
    RadialGradient
    dup()
    {
        return new RadialGradient(this);
    }
}

