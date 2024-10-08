// The following method should return true if and only if pre is a prefix of str. That is, str starts with pre.
method isPrefix(pre: string, str: string) returns (res: bool) {
	if |str| < |pre| {
		return false;
	} else {
		return pre == str[0..|pre|];
	}
}

// The following method should return true if and only if sub is a substring of str. That is, str contains sub.
method isSubstring(sub: string, str: string) returns (res: bool)
{
	if |str| <= 0 {
		return false;
	}

	var x := isPrefix(sub, str);
	if !x {
		res := isSubstring(sub, str[1..]);
		return;
	}

	return true;
}

// The following method should return true if and only if str1 and str2 have a common substring of length k.
method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool)
{
	if |str1| < k || |str2| < k {
		return false;
	}

	var i := 0;
	while i <= |str1| - k {
		var x := isSubstring(str1[i..i+k], str2);
		if x {
			return true;
		}
		i := i + 1;
	}
	return false;
}

// The following method should return the natural number len which is equal to the length of the longest common substring of str1 and str2.
// Note that every two strings have a common substring of length zero.
method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat)
{
	len := 0;
	while len < |str1| && len < |str2| {
		var x := haveCommonKSubstring(len + 1, str1, str2);
		if !x {
			return;
		} else {
			len := len + 1;
		}
	}
	return;
}