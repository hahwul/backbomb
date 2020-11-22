echo "[+] Start init"
echo "[+] Prject name?"
read templatehahwul
echo "[+] Your project name is $templatehahwul"

# 1
echo "[+] Change .goreleaer.yml"
sed "s/TEMPALTE-HAHWUL/$templatehahwul/" .goreleaser.yml > .goreleaser.yml

#2
echo "[+] Make 'go.mod'"
go mod init github.com/hahwul/$templatehahwul

#final
echo "[+] Delete init.sh"
git rm init.sh
echo "[+] Please check '.goreleaser.yml' for descriptions"
