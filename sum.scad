// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function sum(v, i=0, r=0) = i < len(v) ? sum(v, i + 1, r + v[i]) : r;

// duck modified from `sum`
function cumsum(v, i=0, r=0) = i < len(v) ? concat([r + v[i]], cumsum(v, i + 1, r + v[i])) : [];

bleh = [1,2,0,3,3,1];
echo("sum [1,2,0,3,3,1] == ", sum(bleh));
echo("cumsum [1,2,0,3,3,1] == ", cumsum(bleh));

assert (sum(bleh) == 10, "Sum failed");
assert (cumsum(bleh) == [1, 3, 3, 6, 9, 10], "Cumsum failed");