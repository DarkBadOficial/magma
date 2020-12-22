stock strtok(const string[], &index, delimiter = ' ')
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= delimiter))
	{
		index++;
	}

	new offset = index;
	new result[128];
	while ((index < length) && (string[index] > delimiter) && ((index - offset) < (sizeof(result) - 1))) {
		result[index - offset] = string[index];
		index++;
	}

	result[index - offset] = EOS;
	return result;
}

stock strrest(const string[], &index, delimiter = ' ')
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= delimiter))
	{
		index++;
	}

	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}

	result[index - offset] = EOS;
	return result;
}

stock strcpy(dest[], const source[], len = sizeof(dest))
{
	dest[0] = '\0';
	return strcat(dest, source, len);
}

stock strclr(string[])
{
	string[0] = '\0';
}

stock bool:strempty(const string[])
{
	if (string[0] == '\0' || (string[0] == '\1' && string[1] == '\0'))
	{
		return true;
	}
	return false;
}

stock strcount(const string[], character)
{
	new count = 0;
	for(new c = 0, length = strlen(string); c < length; c++)
	{
		if (string[c] == character)
		{
			count++;
		}
	}
	return count;
}

stock strtolower(string[])
{
	for(new c = 0, length = strlen(string); c < length; c++)
	{
		string[c] = tolower(string[c]);
	}
}

stock strtoupper(string[])
{
	for(new c = 0, length = strlen(string); c < length; c++)
	{
		string[c] = toupper(string[c]);
	}
}

//TEXTDRAW CHARACTER WIDTHS
/**
 * -DESCRIPTION:
 * 		-Proportional values for textdraw font ID 1.
 * -NOTES:
 * 		-These values are only correct when (Player)TextDrawSetProportional is set to 1.
 * 		-The final values depend on TextDrawLetterSize and TextDrawSetOutline. There is no easy way to calculate to additional 'thickness', since the outline of one character can, but will not always, flow over to the outline of the next.
 * 		-The returned widths should be multiplied by the texdraw letter size.
 * -CREDITS:
 * 		-GTA San Andreas/data/fonts.dat
 */
static const MainString_CharacterWidths[] = { //Data taken from singleplayer fonts.dat file
	 0, 15, 15, 15, 15, 15, 15, 15,	//NULL is not displayable because it breaks off the string, others display as a space
	15, 15, 15, 15, 15, 15, 15, 15,	//Display as a space
	15, 15, 15, 15, 15, 15, 15, 15,	//Display as a space
	15, 15, 15, 15, 15, 15, 15, 15,	//Display as a space
	15,  9, 17, 27, 20, 34, 23, 12,	//  ! " £ $ % & '
	12, 12, 21, 20, 12, 14, 12, 15,	//( ) * + , - . /
	23, 15, 21, 21, 21, 21, 21, 21,	//0 1 2 3 4 5 6 7
	20, 21, 12, 12, 24, 24, 24, 19,	//8 9 : ; < = > ?
	10, 22, 19, 19, 22, 16, 19, 24,	//tmA B C D E F G
	22, 11, 16, 21, 15, 28, 24, 27,	//H I J K L M N O
	20, 25, 19, 19, 18, 23, 23, 31,	//P Q R S T U V W
	23, 19, 21, 21, 13, 35, 11, 21,	//X Y Z       ! _
	10, 19, 20, 14, 20, 19, 13, 20,	//! a b c d e f g
	19,  9,  9, 19,  9, 29, 19, 21,	//h i j k l m n o
	19, 19, 15, 15, 14, 18, 19, 27,	//p q r s t u v w
	20, 20, 17, 21, 17, 20, 15, 15,	//x y z     $ [ ]
	22, 22, 22, 22, 29, 19, 16, 16,	//À Á Â Ã Æ Ç È É
	16, 16, 11, 11, 11, 11, 27, 27,	//Ê Ë Ì Í Î Ï Ò Ó
	27, 27, 23, 23, 23, 23, 20, 19,	//Ô Ö Ù Ú Û Ü ß à
	19, 19, 19, 30, 14, 19, 19, 19,	//á â ã æ ç è é ê
	19,  9,  9,  9,  9, 21, 21, 21,	//ë ì í î ï ò ó ô
	21, 18, 18, 18, 18, 24, 19, 19,	//ö ù ú û ü Ñ ñ ¿
	20, 18, 19, 19, 21, 19, 19, 19,	//0 1 2 3 4 5 6 7
	19, 19, 16, 19, 19, 19, 20, 19,	//8 9 : A B C D E
	16, 19, 19,  9, 19, 20, 14, 29,	//F G H I J K L M
	19, 19, 19, 19, 19, 19, 21, 19,	//N O P Q R S T U
	20, 32, 21, 19, 19, 19, 19, 19,	//V W X Y Z À Á Â
	19, 29, 19, 19, 19, 19, 19,  9,	//Ã Æ Ç È É Ê Ë Ì
	 9,  9,  9, 19, 19, 19, 19, 19,	//Í Î Ï Ò Ó Ô Ö Ù
	19, 19, 19, 19, 21, 19, 10,  9	//Ú Û Ü ß Ñ ¿ ' .
};

stock GetCharacterWidth(c)
{
	if (c < 0)
	{
		return 0;
	}

	if (c >= sizeof(MainString_CharacterWidths))
	{
		return 20;
	}
	return MainString_CharacterWidths[c];
}

stock GetStringWidth(const string[])
{
	new width = 0;
	for(new c = 0, length = strlen(string); c < length; c++)
	{
		width += GetCharacterWidth(string[c]);
	}
	return width;
}

SpanishFix(const base[])
{
	new result[1024];

	strcat(result, base);

	for (new i = (strlen(result) - 1); i != -1; --i)
	{
        switch (result[i])
        {
            case 'à': result[i] = 151;
            case 'á': result[i] = 152;
            case 'â': result[i] = 153;
            case 'ä': result[i] = 154;
            case 'À': result[i] = 128;
            case 'Á': result[i] = 129;
            case 'Â': result[i] = 130;
            case 'Ä': result[i] = 131;
            case 'è': result[i] = 157;
            case 'é': result[i] = 158;
            case 'ê': result[i] = 159;
            case 'ë': result[i] = 160;
            case 'È': result[i] = 134;
            case 'É': result[i] = 135;
            case 'Ê': result[i] = 136;
            case 'Ë': result[i] = 137;
            case 'ì': result[i] = 161;
            case 'í': result[i] = 162;
            case 'î': result[i] = 163;
            case 'ï': result[i] = 164;
            case 'Ì': result[i] = 138;
            case 'Í': result[i] = 139;
            case 'Î': result[i] = 140;
            case 'Ï': result[i] = 141;
            case 'ò': result[i] = 165;
            case 'ó': result[i] = 166;
            case 'ô': result[i] = 167;
            case 'ö': result[i] = 168;
            case 'Ò': result[i] = 142;
            case 'Ó': result[i] = 143;
            case 'Ô': result[i] = 144;
            case 'Ö': result[i] = 145;
            case 'ù': result[i] = 169;
            case 'ú': result[i] = 170;
            case 'û': result[i] = 171;
            case 'ü': result[i] = 172;
            case 'Ù': result[i] = 146;
            case 'Ú': result[i] = 147;
            case 'Û': result[i] = 148;
            case 'Ü': result[i] = 149;
            case 'ñ': result[i] = 174;
            case 'Ñ': result[i] = 173;
            case '¡': result[i] = 64;
            case '¿': result[i] = 175;
            case '`': result[i] = 177;
            case '#': result[i] = 35;
            case '&': result[i] = 38;
        }
    }
    return result;
}