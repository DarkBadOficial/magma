/*
 * Magma - Main addon
 * Author: Atom
 * GitHub: https://github.com/RealAtom/magma
 */

#pragma option -(+
#pragma option -;+
//#pragma option -l

#pragma option -d3

#pragma warning disable 239
#pragma warning disable 214

#pragma dynamic 15000

#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 1000

#define MAGMA_VERSION "v0.1"

// Mandatory libraries
#include <crashdetect> // Author: https://github.com/Zeex
#include <streamer> // Author: https://github.com/samp-incognito
#include <sscanf2> // Author: https://github.com/maddinat0r
#include <Pawn.RakNet> // Author: https://github.com/katursis
#include <Pawn.CMD> // Author: https://github.com/katursis
#include <Pawn.Regex> // Author: https://github.com/katursis

// Magma libraries
#include <m_player>
#include <m_math>
#include <m_string>
#include <m_color>
#include <m_macros>

// Main addon
#include "../../addons/logger/main.pwn" // Author: https://github.com/Boorz94
#include "../../addons/main.pwn"

callback:JoseLuis(Float:x, var, bobo)
{
	print("hola");
	return 1;
}

main()
{
	SetGameModeText(MAGMA_VERSION);
	Logger_Debug("Magma "MAGMA_VERSION" loaded!");
}