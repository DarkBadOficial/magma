// Author: https://github.com/Boorz94

#if !defined LOGGER_ERROR_TAG
	#define LOGGER_ERROR_TAG "[ERROR - %s:%d] "
#endif

#if !defined LOGGER_WARNING_TAG
	#define LOGGER_WARNING_TAG "[ADVERTENCIA - %s:%d] "
#endif

#if !defined LOGGER_DEBUG_TAG
	#define LOGGER_DEBUG_TAG "[DEBUG - %s %s] "
#endif

#define _LOGGER_DETECT_PARAMS:%0) %0,"")
#define _LOGGER_TYPE(%0) _:_LOGGER_TYPE_ERROR:_LOGGER_TYPE_WARNING:_LOGGER_TYPE_DEBUG(%0)

#if defined LOGGER_NOT_WRITE_LOG
	#define _LOGGER_MODIFY_FUNC:%0(%2,_:_LOGGER_DETECT_PARAMS:%1) %0(%2,_:_LOGGER_DETECT_PARAMS:%1,"")))
#else
	#define _LOGGER_MODIFY_FUNC:%0(%2,_:_LOGGER_DETECT_PARAMS:%1) %0(%2,_:_LOGGER_DETECT_PARAMS:%1,""))
#endif

#if defined sprintf
	#define _LOGGER_FMT sprintf
#elseif defined va_return
	#define _LOGGER_FMT va_return
#else
	#define _LOGGER_FMT __Logger_Format

	stock __Logger_Format(const text[], {Float, _}:...)
	{
		static
			total_args,
			output[128];
		
		const
			size = sizeof(output);

		if ((total_args = numargs()) == 1)
		{
			format(output, size, text);
		}
		else
		{
			new arg, bytes = ((total_args + 2) * 4);

			for(arg = ((total_args * 4) + 8); arg > 12; arg -= 4)
			{
				#emit lctrl 5
				#emit load.s.alt arg
				#emit add
				#emit load.i
				#emit push.pri
			}

			#emit push.s text
			#emit push.c size
			#emit push.c output
			#emit push.s bytes
			#emit sysreq.c format

			#emit load.s.pri bytes
			#emit add.c 4
			#emit move.alt
			#emit lctrl 4
			#emit add
			#emit sctrl 4
		}
		return output;
	}
#endif

#if !defined LOGGER_CLOSE_ON_ERROR
	#define _LOGGER_TYPE_ERROR:_LOGGER_TYPE_WARNING:_LOGGER_TYPE_DEBUG(%0,%2_ERROR,%1) LOGGER_ERROR_TAG %0, __file, __line, %1
#else
	#define _LOGGER_TYPE_ERROR:_LOGGER_TYPE_WARNING:_LOGGER_TYPE_DEBUG(%0,%2_ERROR,%1) LOGGER_ERROR_TAG %0, __file, __line, %1, SendRconCommand("exit")
#endif

#define _LOGGER_TYPE_WARNING:_LOGGER_TYPE_DEBUG(%0,%2_WARNING,%1) LOGGER_WARNING_TAG %0, __file, __line, %1

#if defined LOGGER_DISABLE_DEBUG
	#define Logger_Debug(%0);
#elseif defined LOGGER_DEBUG_FULL
	#define _LOGGER_TYPE_DEBUG(%0,%2_DEBUG,%1) LOGGER_DEBUG_TAG %0, __date, __time, %1, SendClientMessageToAll(0x8FD862FF, _LOGGER_FMT("[DEBUG] {DADADA}" %0, %1))
	#define Logger_Debug(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_DEBUG,_:_LOGGER_DETECT_PARAMS:%0)
#else
	#define _LOGGER_TYPE_DEBUG(%0,%2_DEBUG,%1) LOGGER_DEBUG_TAG %0, __date, __time, %1
	#define Logger_Debug(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_DEBUG,_:_LOGGER_DETECT_PARAMS:%0)
#endif

#if defined LOGGER_NOT_WRITE_LOG
	#define _LOGGER_PROCESS(%2,_:%0,%1) stdout(_LOGGER_FMT(_LOGGER_TYPE(%0"\n",%2,%1)

	stock stdout(const text[])
	{
		new File:handle = fopen("CON", io_write);

		if (!handle)
		{
			print("=====================  SIMPLE_LOGGER ERROR  =====================\nNo se pudo inicializar stdout.\n\nPosibles errores:\n- La carpeta scriptfiles no existe.\n- Si estás en Linux deberás crear el archivo 'CON' manualmente y darle todos los permisos.\n=================================================================\n");
			return 0;
		}

		fwrite(handle, text);
		fclose(handle);
		return 1;
	}
#else
	#define _LOGGER_PROCESS(%2,_:%0,%1) printf(_LOGGER_TYPE(%0,%2,%1)
#endif

#define _LOGGER_SPECIAL_TAG:<%0>(%1),_LOGGER_PROCESS(%2,%3, Logger_Write<%2>(%0,%1)

#define Logger_Error%0(%1) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_ERROR,_:_LOGGER_DETECT_PARAMS:%1)
#define Logger_Warning%0(%1) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_WARNING,_:_LOGGER_DETECT_PARAMS:%1)

#define _LOGGER_PROCESS_WRITE(%0,%1,%2,%3) _Logger_Write(%1, _LOGGER_FMT("%s %s [" #%0 "] " %2 "\r\n", __date, __time,%3))
#define Logger_Write<%0>(%1,%2) _LOGGER_PROCESS_WRITE(%0,%1,%2,"")
stock _Logger_Write(const path[], const message[])
{
	new File:handle = fopen(path, (fexist(path) ? io_append : io_write));

	if (!handle)
	{
		return 0;
	}

	fwrite(handle, message);
	fclose(handle);
	return 1;
}
