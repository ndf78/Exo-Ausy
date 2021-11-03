*** Settings ***
Library           Selenium2Library

*** Variables ***
${browser}        chrome
${url}    http://www.randstad.fr/
${time}    2
${search}    boulanger

*** Keywords ***
Connexion au site de Randstad
    Open Browser    ${url}    ${browser}    # Ouvrir chrome
    Maximize Browser Window    # Mettre la fenetre de chrome en plein ecran
    Sleep    ${time}
    Selenium2Library.Click Button    onetrust-reject-all-handler    # Cliquer sur le bouton "tout refuser"

Recherche sur le site
    Selenium2Library.Click Element    //span[@class='label']    # Cliquer sur "région ou département"
    Selenium2Library.Click Element    //li[text()='Bretagne']    # Cliquer sur la "Bretagne"
    Selenium2Library.Input Text    //input[@class='job ac ac-job']    ${search}    # Cliquer sur la recherche du site, Ecrire "boulanger"
    Selenium2Library.Click Element    //span[@class='icon icon-arrow-right8']    # Cliquer sur l'icone pour démarrer la recherche
    Selenium2Library.Click Element    //a[contains(text(), 'BOULANGER')]    # Cliquer sur la première offre avec "Boulanger"
    Scroll Element into view    //h3[text()='informations complémentaires']    # Scroll jusqu'à "Information complémentaires"
    Selenium2Library.Capture page screenshot  Verification.png    # Screenshot de la page

    Sleep    ${time}

Verification que le niveau d'etude est present
    Page should contain    niveau d'études

Verification que le salaire minimum est present
    Page should contain    salaire minimum

Verification que le type de salaire est present
    Page should contain    type de salaire

*** Test Cases ***
Google Index
    Connexion au site de Randstad
    Recherche sur le site
    Verification que le niveau d'etude est present
    Verification que le salaire minimum est present
    Verification que le type de salaire est present


