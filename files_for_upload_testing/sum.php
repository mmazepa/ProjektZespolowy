<?php
if (isset($_POST['licz'])) {
	$liczba_a=floatval($_POST['a']); // Konwersja na liczbę zmiennoprzecinkową
	$liczba_b=floatval($_POST['b']);
	echo "Chcesz obliczyć sumę następujących liczb:" . "<br />" . "<b>";
	print_r($liczba_a);
	echo "</b>" . "<br />" . "Oraz:" . "<br />" . "<b>";
	print_r($liczba_b);
	echo "</b>" . "<hr />";
	echo "Ich suma to:" . " <b>";
	$wynik = $liczba_a + $liczba_b;
	echo $wynik;
	echo "</b>";
} else {
	echo "Wpisz liczby.";
}
?>