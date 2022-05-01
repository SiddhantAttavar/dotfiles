$downloadsDir = 'D:/Downloads';
$allenDir = 'D:/Allen/Grade 12/';

foreach ($pdf in Get-ChildItem $downloadsDir -Filter '*.pdf') {
	$subject = Read-Host "$pdf Subject: ";
	$destDir = $allenDir;
	if ($subject -eq 'p') {
		Move-Item $downloadsDir/$pdf "$destDir/Physics";
	}
	elseif ($subject -eq 'c') {
		Move-Item $downloadsDir/$pdf "$destDir/Chemistry";
	}
	elseif ($subject -eq 'm') {
		Move-Item $downloadsDir/$pdf "$destDir/Mathematics";
	}
	elseif ($subject -eq 'o') {
		Move-Item $downloadsDir/$pdf "$destDir/Others";
	}
}
