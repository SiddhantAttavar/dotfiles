$downloadsDir = 'D:/Downloads';
$allenDir = 'D:/Allen/Grade 12/';

foreach ($pdf in Get-ChildItem $downloadsDir -Filter '*.pdf') {
	if((Get-Content $pdf.FullName | select -first 1 ) -like "%PDF-1.5*") {
		$subject = Read-Host "$pdf.FullName Subject: ";
		$destDir = $allenDir;
		if ($subject == 'p') {
			$destDir += 'Physics';
		}
		else if ($subject == 'c') {
			$destDir += 'Chemistry';
		}
		else if ($subject == 'm') {
			$destDir += 'Mathematics';
		}
		else if ($subject == 'o') {
			$destDir += 'Others';
		}

		Move-Item $pdf $destDir;
	}
}
