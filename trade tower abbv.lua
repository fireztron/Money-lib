--// CREDITS TO BEREZAA FOR MONEY LIB !
local MoneyLib = {}
MoneyLib.Suffixes = {}
MoneyLib.Suffixes[1] = "K"
MoneyLib.Suffixes[2] = "M"
MoneyLib.Suffixes[3] = "B"
MoneyLib.Suffixes[4] = "T"
MoneyLib.Suffixes[5] = "Qd"
MoneyLib.Suffixes[6] = "Qn"
MoneyLib.Suffixes[7] = "Sx"
MoneyLib.Suffixes[8] = "Sp"
MoneyLib.Suffixes[9] = "O"
MoneyLib.Suffixes[10] = "N"
MoneyLib.Suffixes[11] = "D"
MoneyLib.Suffixes[12] = "UD"
MoneyLib.Suffixes[13] = "DD"
MoneyLib.Suffixes[14] = "TD"
MoneyLib.Suffixes[15] = "QD"
MoneyLib.Suffixes[16] = "qD"
MoneyLib.Suffixes[17] = "SD"
MoneyLib.Suffixes[18] = "sD"
MoneyLib.Suffixes[19] = "OD"
MoneyLib.Suffixes[20] = "ND"
MoneyLib.Suffixes[21] = "V"
MoneyLib.Suffixes[22] = "UV"
MoneyLib.Suffixes[23] = "DV"
MoneyLib.Suffixes[24] = "TV"
MoneyLib.Suffixes[25] = "QV"
MoneyLib.Suffixes[26] = "qV"
MoneyLib.Suffixes[27] = "SV"
MoneyLib.Suffixes[28] = "sV"
MoneyLib.Suffixes[29] = "OV"
MoneyLib.Suffixes[30] = "NV"
MoneyLib.Suffixes[31] = "Tr"
MoneyLib.Suffixes[32] = "UTr"
MoneyLib.Suffixes[33] = "DTr"
MoneyLib.Suffixes[34] = "TTr"
MoneyLib.Suffixes[35] = "QTr"
MoneyLib.Suffixes[36] = "qTr"
MoneyLib.Suffixes[37] = "STr"
MoneyLib.Suffixes[38] = "sTr"
MoneyLib.Suffixes[39] = "OTr"
MoneyLib.Suffixes[40] = "NTr"
MoneyLib.Suffixes[41] = "QU"
MoneyLib.Suffixes[42] = "UQU"
MoneyLib.Suffixes[43] = "DQU"
MoneyLib.Suffixes[44] = "TQU"
MoneyLib.Suffixes[45] = "QQU"
MoneyLib.Suffixes[46] = "qQU"
MoneyLib.Suffixes[47] = "SQU"
MoneyLib.Suffixes[48] = "sQU"
MoneyLib.Suffixes[49] = "OQU"
MoneyLib.Suffixes[50] = "NQU"
MoneyLib.Suffixes[51] = "qu"
MoneyLib.Suffixes[52] = "Uqu"
MoneyLib.Suffixes[53] = "Dqu"
MoneyLib.Suffixes[54] = "Tqu"
MoneyLib.Suffixes[55] = "Qqu"
MoneyLib.Suffixes[56] = "qqu"
MoneyLib.Suffixes[57] = "Squ"
MoneyLib.Suffixes[58] = "squ"
MoneyLib.Suffixes[59] = "Oqu"
MoneyLib.Suffixes[60] = "Nqu"
MoneyLib.Suffixes[61] = "Se"
MoneyLib.Suffixes[62] = "USe"
MoneyLib.Suffixes[63] = "DSe"
MoneyLib.Suffixes[64] = "TSe"
MoneyLib.Suffixes[65] = "QSe"
MoneyLib.Suffixes[66] = "qSe"
MoneyLib.Suffixes[67] = "SSe"
MoneyLib.Suffixes[68] = "sSe"
MoneyLib.Suffixes[69] = "OSe"
MoneyLib.Suffixes[70] = "NSe"
MoneyLib.Suffixes[71] = "Sp"
MoneyLib.Suffixes[72] = "USp"
MoneyLib.Suffixes[73] = "DSp"
MoneyLib.Suffixes[74] = "TSp"
MoneyLib.Suffixes[75] = "QSp"
MoneyLib.Suffixes[76] = "qSp"
MoneyLib.Suffixes[77] = "SSp"
MoneyLib.Suffixes[78] = "sSp"
MoneyLib.Suffixes[79] = "OSp"
MoneyLib.Suffixes[80] = "NSp"
MoneyLib.Suffixes[81] = "Og"
MoneyLib.Suffixes[82] = "UOg"
MoneyLib.Suffixes[83] = "DOg"
MoneyLib.Suffixes[84] = "TOg"
MoneyLib.Suffixes[85] = "QOg"
MoneyLib.Suffixes[86] = "qOg"
MoneyLib.Suffixes[87] = "SOg"
MoneyLib.Suffixes[88] = "sOg"
MoneyLib.Suffixes[89] = "OOg"
MoneyLib.Suffixes[90] = "NOg"
MoneyLib.Suffixes[91] = "No"
MoneyLib.Suffixes[92] = "UNo"
MoneyLib.Suffixes[93] = "DNo"
MoneyLib.Suffixes[94] = "TNo"
MoneyLib.Suffixes[95] = "QNo"
MoneyLib.Suffixes[96] = "qNo"
MoneyLib.Suffixes[97] = "SNo"
MoneyLib.Suffixes[98] = "sNo"
MoneyLib.Suffixes[99] = "ONo"
MoneyLib.Suffixes[100] = "NNo"
MoneyLib.Suffixes[101] = "C"
MoneyLib.Suffixes[102] = "CU"
MoneyLib.Suffixes[103] = "Infinity"                                            
MoneyLib.CachedShorts = {}
MoneyLib.ShortToLong = function(MoneyShort)
	if MoneyLib.CachedShorts[MoneyShort] ~= nil then
		return MoneyLib.CachedShorts[MoneyShort]
	end
	local result
	local eCutoff = string.find(MoneyShort,"e%+")
	if eCutoff ~= nil then
		local Coeff = tonumber(string.sub(tostring(MoneyShort),1,1))
		local Zeros = tonumber(string.sub(tostring(MoneyShort),eCutoff+2))
		result = Coeff * 10^Zeros
	else	
		for i,v in pairs(MoneyLib.Suffixes) do
			local Cutoff = string.find(MoneyShort,v)
		--	print(string.sub(MoneyShort,string.len(MoneyShort)-string.len(v)+1),v)
			if Cutoff ~= nil and string.sub(MoneyShort,string.len(MoneyShort)-string.len(v)+1) == v then
				local Moneh = string.sub(MoneyShort,1,string.len(MoneyShort)-string.len(v))
				local Answer = tonumber(Moneh) * 10^(3*i)
				result = Answer
			end
		end
	end
	MoneyLib.CachedShorts[MoneyShort] = result
	return result
end                                              
MoneyLib.CachedShorts = {}
MoneyLib.ShortToLong = function(MoneyShort)
	if MoneyLib.CachedShorts[MoneyShort] ~= nil then
		return MoneyLib.CachedShorts[MoneyShort]
	end
	local result
	local eCutoff = string.find(MoneyShort,"e%+")
	if eCutoff ~= nil then
		local Coeff = tonumber(string.sub(tostring(MoneyShort),1,1))
		local Zeros = tonumber(string.sub(tostring(MoneyShort),eCutoff+2))
		result = Coeff * 10^Zeros
	else	
		for i,v in pairs(MoneyLib.Suffixes) do
			local Cutoff = string.find(MoneyShort,v)
		--	print(string.sub(MoneyShort,string.len(MoneyShort)-string.len(v)+1),v)
			if Cutoff ~= nil and string.sub(MoneyShort,string.len(MoneyShort)-string.len(v)+1) == v then
				local Moneh = string.sub(MoneyShort,1,string.len(MoneyShort)-string.len(v))
				local Answer = tonumber(Moneh) * 10^(3*i)
				result = Answer
			end
		end
	end
	MoneyLib.CachedShorts[MoneyShort] = result
	return result
end
return MoneyLib
