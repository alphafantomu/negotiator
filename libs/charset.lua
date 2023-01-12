
local require = require;
local table = table;
local table_sort = table.sort;

local extension = require('discordia-extensions');
local string_split, string_trim = extension.string.split, extension.string.trim;

local SIMPLE_CHARSET_PATTERN = '';

local parseAcceptCharset, parseCharset;

parseAcceptCharset = function(accept)
	local accepts = string_split(accept, ',');
	local n = #accepts;
	local j = 0;
	for i = 1, n do
		local charset = parseCharset(string_trim(accepts[i]), i);
		if (charset) then
			j = j + 1;
			accepts[j] = charset;
		end;
	end;
	if (j < n) then
		for i = j, n do
			accepts[i] = nil;
		end;
	end;
	return accepts;
end;

parseCharset = function(str, i)
	
end;


var simpleCharsetRegExp = /^\s*([^\s;]+)\s*(?:;(.*))?$/;

var match = simpleCharsetRegExp.exec(str);
   if (!match) return null;
 
   var charset = match[1];
   var q = 1;
   if (match[2]) {
	 var params = match[2].split(';')
	 for (var j = 0; j < params.length; j++) {
	   var p = params[j].trim().split('=');
	   if (p[0] === 'q') {
		 q = parseFloat(p[1]);
		 break;
	   }
	 }
   }
 
   return {
	 charset: charset,
	 q: q,
	 i: i
   };

local getCharsetPriority = function()

end;

local specify = function()

end;

local compareSpecs = function(a, b)
	return (b.q - a.q) or (b.s - a.s) or (a.o - b.o) or (a.i - b.i) or 0;
end;

local getFullCharset = function(spec)
	return spec.charset;
end;

local isQuality = function(spec)
	return spec.q > 0;
end;

var priorities = provided.map(function getPriority(type, index) {
  return getCharsetPriority(type, accepts, index);
});

// sorted list of accepted charsets
return priorities.filter(isQuality).sort(compareSpecs).map(function getCharset(priority) {
  return provided[priorities.indexOf(priority)];
});

local preferredCharsets = function(accept, provided)
	local accepts = parseAcceptCharset(accept or '*');
	if not (provided) then
		local n = #accepts;
		for i = 1, n do
			if not (isQuality(accepts[i])) then
				accepts[i], n = nil, n - 1;
			end;
		end;
		table_sort(accepts, compareSpecs);
		for i = 1, n do
			accepts[i] = getFullCharset(accepts[i]);
		end;
	end;
	local priorities = {};
	
end;

return preferredCharsets;