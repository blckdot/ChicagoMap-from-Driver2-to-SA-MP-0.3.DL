/**
--------------------------------------------------------------------------
|           |==============================================|             |
|           |          Binary Read/Write funtions          |             |
|           |============================ v0.3 ============|             |
|                                                                        |
|		    |=== Authors: =================================|             |
|		    |=> Aleks10           (Aleksey.al09@gmail.com) |             |
|           |=> Romanius               (romanius@namba.kg) |             |
|		    |==============================================|             |
|                                                                        |
|  This script is free software: you can redistribute it and/or modify   |
|  it under the terms of the GNU General Public License as published by  |
|  the Free Software Foundation, either version 3 of the License, or     |
|  (at your option) any later version.                                   |
|                                                                        |
|  This script is distributed in the hope that it will be useful,        |
|  but WITHOUT ANY WARRANTY; without even the implied warranty of        |
|  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         |
|  GNU General Public License for more details.                          |
|                                                                        |
|  You should have received a copy of the GNU General Public License     |
|  along with this script.  If not, see <http://www.gnu.org/licenses/>.  |
|																		 |
--------------------------------------------------------------------------
**/

#if defined _r_io_included
	#endinput
#endif
#define _r_io_included

#include <file>

enum
{
	BIG_EDIAN,
	LITTLE_EDIAN,
}

// ��������� 1 ���� �� �����
stock readByte(File:f)
{
	new b;
	
	b = fgetchar(f, b, false);
	
	return b;
}

// ��������� 2 ����� �� �����
stock readInt16(File:f, e = LITTLE_EDIAN)
{
	new b[2];
	
	if(e == LITTLE_EDIAN)
		for(new i; i < 2; i++)
			b[i] = fgetchar(f, b[i], false);
	else
		for(new i = 1; i >= 0; --i)
			b[i] = fgetchar(f, b[i], false);
	
	return (b[1] << 8) | b[0];
}

// ��������� 4 ����� �� �����
stock readInt32(File:f, e = LITTLE_EDIAN)
{
	new b[4];
	
	if(e == LITTLE_EDIAN)
		for(new i; i < 4; i++)
			b[i] = fgetchar(f, b[i], false);
	else
		for(new i = 3; i >= 0; --i)
			b[i] = fgetchar(f, b[i], false);
	
	return (b[3] << 24) | (b[2] << 16) | (b[1] << 8) | b[0];
}

// ���������� 1 ���� � ����
stock writeByte(File:f, data)
{
	fputchar(f, data, false);
}

// ���������� 2 ����� � ����
stock writeInt16(File:f, data, e = LITTLE_EDIAN)
{
	new b[2];
	
	b[0] = (data & 0xFF00) >> 8;
	b[1] = data & 0xFF;
	
	if(e == LITTLE_EDIAN)
		for(new i = 1; i >= 0; --i)
			fputchar(f, b[i], false);
	else
		for(new i; i < 2; i++)
			fputchar(f, b[i], false);
}

// ���������� 4 ����� � ����
stock writeInt32(File:f, data, e = LITTLE_EDIAN)
{
	new b[4];
	
	b[0] = (data & 0xFF000000) >> 24;
	b[1] = (data & 0x00FF0000) >> 16;
	b[2] = (data & 0x0000FF00) >> 8;
	b[3] = data & 0x000000FF;
	
	if(e == LITTLE_EDIAN)
		for(new i = 3; i >= 0; --i)
			fputchar(f, b[i], false);
	else
		for(new i; i < 4; i++)
			fputchar(f, b[i], false);
}