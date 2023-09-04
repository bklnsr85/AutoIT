Dim $array[3][3] = [[10,54,73],[87,23,1],[5,64,71]]

Dim $ret
For $i = 0 To 2
	For $j = 0 To 2
		$ret &= $array[$i][$j] & @TAB
	Next
	$ret &= @LF
Next

MsgBox(0, "2D display", $ret)