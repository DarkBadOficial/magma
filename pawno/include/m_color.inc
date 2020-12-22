#define RGBA(%1,%2,%3,%4)        (((%4) & 0xFF) | (((%3) & 0xFF) << 8) | (((%2) & 0xFF) << 16) | ((%1) << 24))
#define HEX(%0,%1,%2,%3,%4)    (((%1) = ((%0) >>> 24)),((%2) = (((%0) >>> 16) & 0xFF)),((%3) = (((%0) >>> 8) & 0xFF)),((%4) = ((%0) & 0xFF)))

stock GetMin(r, g)
{
    new highest;
    if(r > highest)
    {
        highest = g;
    }
    else highest = r;
    return highest;
}

stock ColorAdjustDarkness(color, Float:adjust)
{
    new rgb_r, rgb_g, rgb_b, rgb_a;
    HEX(color, rgb_r, rgb_g, rgb_b, rgb_a);
    rgb_r = GetMin(255, floatround(rgb_r / adjust));
    rgb_g = GetMin(255, floatround(rgb_g / adjust));
    rgb_b = GetMin(255, floatround(rgb_b / adjust));
    return RGBA(rgb_r, rgb_g, rgb_b, rgb_a);
}

stock HexToRGBA(colour, &r, &g, &b, &a)
{
    r = (colour >> 24) & 0xFF;
    g = (colour >> 16) & 0xFF;
    b = (colour >> 8) & 0xFF;
    a = colour & 0xFF;
}

stock RGBAToHex(r, g, b, a)
{
    return (r<<24 | g<<16 | b<<8 | a);
}

stock RGBAToARGB(col)
{
    return ((((col) << 24) & 0xFF000000) | (((col) >>> 8) & 0xF7F7F7));
}

stock ARGBToRGBA(col)
{
    return ((((col) << 8) & 0xF7F7F700) | (((col) >>> 24) & 0xFF));
}

stock ColorSetAlpha(color, alpha = 0xFF)
{
    return ((color & ~0xFF) | (clamp(alpha, 0x00, 0xFF)));
}