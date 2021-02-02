{ Ce jeu a été développé par Grégory Bersegeay (http://www.gbesoft.fr) à l'occasion de la Global Game Jam 2021.
  Le thème était "Lost and Found".
  Le code source a été écrit avec Delphi Sydney. Il est disponbile sur Github (https://github.com/gbegreg/LostNFound)
  et vous aurez besoin de mes composants opensource GBE3D (https://github.com/gbegreg/GBE3D).
}
unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Types3D, FMX.Objects, GBEPlayerPosition,
  FMX.Objects3D, GBEHeightmap, FMX.MaterialSources, FMX.Controls3D,
  GBEJoystick, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Viewport3D, GBEViewport3D, FMX.Ani, Generics.collections, uGBEUtils3D,
  GBEClouds, GBEPlaneExtend, uGBEImageUtils, System.IOUtils,
  FMX.Filter.Effects, GBEGrass, System.Threading, uGameUtils, uGBEOptionsUtils,
  FMX.Effects, FMX.ListBox, FMX.Edit, FMX.EditBox, FMX.SpinBox, inifiles,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, System.DateUtils, uGBESound,
  FMX.Media;

type
  TfMain = class(TForm)
    GBEViewport3D: TGBEViewport3D;
    layDroit: TLayout;
    layGauche: TLayout;
    layInfos: TLayout;
    lblFPS: TLabel;
    lblEnnemis: TLabel;
    lblMunitions: TLabel;
    GBEJoystick1: TGBEJoystick;
    dmyMonde: TDummy;
    Light1: TLight;
    lmsSol: TLightMaterialSource;
    hSol: TGBEHeightmap;
    GBEPlayerPosition: TGBEPlayerPosition;
    aniPrincipale: TFloatAnimation;
    cmsBalle: TColorMaterialSource;
    dmyEnnemis: TDummy;
    tmsMer: TTextureMaterialSource;
    pleMer: TGBEPlaneExtend;
    dmyArbres: TDummy;
    arbre: TModel3D;
    lmsArbre: TLightMaterialSource;
    cameraCarte: TCamera;
    dmyHerbe: TDummy;
    pistolet: TModel3D;
    aniPistolet: TFloatAnimation;
    rVie: TRectangle;
    rPointsVie: TRectangle;
    lmsEnnemiOrange: TLightMaterialSource;
    lmsEnnemiRouge: TLightMaterialSource;
    layGame: TLayout;
    layEcranMenu: TLayout;
    imgTitre: TImage;
    lblGBE: TLabel;
    rAccueil: TRectangle;
    layMenu: TLayout;
    rJouer: TRectangle;
    lblJouer: TLabel;
    GlowEffect1: TGlowEffect;
    rOptions: TRectangle;
    lblOptions: TLabel;
    GlowEffect3: TGlowEffect;
    rScores: TRectangle;
    lblScores: TLabel;
    GlowEffect4: TGlowEffect;
    rAide: TRectangle;
    lblAide: TLabel;
    GlowEffect2: TGlowEffect;
    layEcranOptions: TLayout;
    layOptionsBas: TLayout;
    rOptionsOk: TRectangle;
    lblOptionsOK: TLabel;
    GlowEffect5: TGlowEffect;
    rEcranOptions: TRectangle;
    rGroupeOptions: TRectangle;
    layOptionsGauche: TLayout;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    Label2: TLabel;
    cbFiltre: TComboBox;
    layBoutons: TLayout;
    imgRetourMenu: TImage;
    GlowEffect6: TGlowEffect;
    layVictoire: TLayout;
    Label3: TLabel;
    ShadowEffect2: TShadowEffect;
    layVictoireBas: TLayout;
    Rectangle1: TRectangle;
    Label4: TLabel;
    GlowEffect7: TGlowEffect;
    layGameover: TLayout;
    Label5: TLabel;
    ShadowEffect3: TShadowEffect;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Label6: TLabel;
    GlowEffect8: TGlowEffect;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    layAide: TLayout;
    Rectangle5: TRectangle;
    Label7: TLabel;
    ShadowEffect4: TShadowEffect;
    Layout3: TLayout;
    Rectangle6: TRectangle;
    Label8: TLabel;
    GlowEffect9: TGlowEffect;
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    lblChrono: TLabel;
    dmyBonus: TDummy;
    lmsBonusMunition: TLightMaterialSource;
    lmsBonusPointDeVie: TLightMaterialSource;
    aniPistoletRecharge: TFloatAnimation;
    lblVictoireMessage: TLabel;
    cbAnimerMer: TSwitch;
    lblAnimerMer: TLabel;
    Label9: TLabel;
    cbAfficherFPS: TSwitch;
    Label11: TLabel;
    cbAnimerHerbe: TSwitch;
    Label12: TLabel;
    cbHerbe: TSwitch;
    sbNbHerbe: TSpinBox;
    Label15: TLabel;
    layHighScores: TLayout;
    Rectangle7: TRectangle;
    Label17: TLabel;
    ShadowEffect5: TShadowEffect;
    Layout4: TLayout;
    Rectangle8: TRectangle;
    Label18: TLabel;
    GlowEffect10: TGlowEffect;
    lblRecord: TLabel;
    Layout1: TLayout;
    Rectangle9: TRectangle;
    Label19: TLabel;
    GlowEffect11: TGlowEffect;
    Viewport3D1: TViewport3D;
    Light2: TLight;
    layIntro: TLayout;
    Rectangle10: TRectangle;
    Viewport3D2: TViewport3D;
    Text3D1: TText3D;
    lmsGGJ: TLightMaterialSource;
    Light3: TLight;
    aniIntro: TFloatAnimation;
    Image1: TImage;
    GlowEffect12: TGlowEffect;
    aniIntro2: TFloatAnimation;
    sCiel: TSphere;
    lmsMer: TLightMaterialSource;
    tmsCiel: TTextureMaterialSource;
    aniCiel: TFloatAnimation;
    mpAmbiance: TMediaPlayer;
    mpSons: TMediaPlayer;
    pistoletMat01: TLightMaterialSource;
    pistoletMat11: TLightMaterialSource;
    pistoletMat21: TLightMaterialSource;
    pistoletMat31: TLightMaterialSource;
    pistoletMat41: TLightMaterialSource;
    Light4: TLight;
    mpSons2: TMediaPlayer;
    lmsHerbe: TLightMaterialSource;
    Circle2: TCircle;
    aniViseur: TFloatAnimation;
    WaveEffect1: TWaveEffect;
    aniVague: TFloatAnimation;
    Layout5: TLayout;
    Layout6: TLayout;
    aniIntroBouton: TFloatAnimation;
    Image3: TImage;
    corps: TCube;
    jambeD: TCube;
    jambeG: TCube;
    Sphere2: TSphere;
    brasD: TCube;
    brasG: TCube;
    lmsCorps: TLightMaterialSource;
    lmsJambe: TLightMaterialSource;
    lmsTete: TLightMaterialSource;
    bmpAniTete: TBitmapListAnimation;
    lmsBras: TLightMaterialSource;
    dmyEnnemi1: TDummy;
    aniJambe: TFloatAnimation;
    aniJambeGauche: TFloatAnimation;
    Image2: TImage;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Rectangle3D1: TRectangle3D;
    dmySortie: TDummy;
    lmsPorte: TLightMaterialSource;
    Rectangle3D2: TRectangle3D;
    lmsPorte2: TLightMaterialSource;
    Rectangle3D3: TRectangle3D;
    Rectangle3D4: TRectangle3D;
    Rectangle3D5: TRectangle3D;
    Layout10: TLayout;
    Layout11: TLayout;
    lmsBonusIndice: TLightMaterialSource;
    rIndice1: TRectangle;
    lblIndice1: TLabel;
    rIndice2: TRectangle;
    lblIndice2: TLabel;
    rIndice3: TRectangle;
    lblIndice3: TLabel;
    lblMessage: TLabel;
    Layout12: TLayout;
    Label10: TLabel;
    cbKeyboard: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure aniPrincipaleProcess(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure rJouerClick(Sender: TObject);
    procedure rOptionsClick(Sender: TObject);
    procedure rOptionsOkClick(Sender: TObject);
    procedure imgRetourMenuClick(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure rAideClick(Sender: TObject);
    procedure rScoresClick(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure aniIntroBoutonProcess(Sender: TObject);
  private
    procedure TournerADroite;
    procedure TournerAGauche;
    procedure Avancer;
    procedure Reculer;
    procedure GererTouches;
    procedure GererDeplacementJoueur;
    procedure GererTir;
    procedure Tirer;
    procedure ChargerEnnemis;
    procedure deplacerEnnemi(Sender: TObject);
    function DetecterCollisionBalleEnnemis(balle: TSphere): TGBECollisionRetour;
    procedure ChargerArbres;
    procedure decalerDroite;
    procedure decalerGauche;
    procedure gererHerbe;
    procedure GenererHerbe(nombre: integer);
    procedure RetournerPositionPrecedente;
    procedure ReplacerHerbe(objet: TGBEGrass);
    procedure LancerNouvellePartie;
    procedure AppliquerConfig;
    procedure EnregistrerConfig;
    procedure AfficherJeu;
    procedure AfficherAide;
    procedure AfficherGameOver;
    procedure AfficherHighScores;
    procedure AfficherIntro;
    procedure AfficherMenu;
    procedure AfficherOptions;
    procedure AfficherVictoire;
    procedure MasquerLayouts;
    procedure ChargerConfig;
    procedure ChargerBonus;
    procedure detecterCollisionBonus;
    procedure GererVitesseTouche(sensibilite: single);
    procedure CreerAnimationDeplacement(objet: TControl3D);
    { Déclarations privées }
  public
    { Déclarations publiques }
    vitesse, vitesseTouche, demiHauteur, demiHauteurEnnemi, demiHauteurArbre, demiDistanceAffichageHerbe, pointsVie, demiHauteurHerbe: single;
    toucheDroite, toucheGauche, toucheAvancer, toucheReculer, toucheTir, tirPossible, toucheCoteDroit, toucheCoteGauche: boolean;
    listeBalles: TList<TTir>;
    nbBalles, nbEnnemisRestants: integer;
    listeAnimations: TList<TFloatAnimation>;
    OptionsCommunes: TGBEOptions;
    SceneJeu: TSceneJeu;
    keyboard: TKeyboardType;
    fichierOptions, repSons: string;
    heureFin, heureDebut, heureTerminee, meilleurTemps: TTime;
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

procedure TfMain.aniIntroBoutonProcess(Sender: TObject);
begin
  Image3.Opacity := Image2.Opacity;
end;

// boucle principale : affichage de la scène
procedure TfMain.aniPrincipaleProcess(Sender: TObject);
begin
  case SceneJeu of
    intro: AfficherIntro;
    menu:  AfficherMenu;
    jeu:   AfficherJeu;
    options: AfficherOptions;
    gameover: AfficherGameOver;
    victoire: AfficherVictoire;
    aide:  AfficherAide;
    highScores: AfficherHighScores;
  end;
end;

procedure TfMain.AfficherJeu;
var
  musique: string;
begin
  if not(layGame.Visible) then begin // si on arrive sur la scène
    MasquerLayouts;                  // on masque les autres écrans
    LancerNouvellePartie;            // on initialise la partie
    layGame.Visible := true;         // on affiche l'écran de jeu
  end;

  if OptionsCommunes.afficherFPS then lblFPS.Text := 'FPS : ' + GBEViewport3D.FPS.ToString;
  lblMunitions.Text := 'Ammunition : ' + nbBalles.ToString;
  lblEnnemis.Text := 'Zombies : ' + nbEnnemisRestants.ToString;
  lblChrono.Text := formatdatetime('nn:ss', heureFin - now);

  GererTouches;  // gestion des touches appuyées
  GererTir;      // gestion des tirs en cours
  GererDeplacementJoueur;  // gestion des déplacements du joueur
  rPointsVie.Width := pointsVie * (rVie.Width - rPointsVie.Margins.Left - rPointsVie.Margins.Right) * 0.01;  // gestion des points de vie
  if OptionsCommunes.activerHerbe then gererHerbe;  // gestion de l'herbe si elle est activée

  // la musique d'ambiance est fonction de la hauteur du joueur : si proche du niveau de la mer, alors bruit des vagues, sinon bruit des crickets
  musique := lowercase(mpAmbiance.FileName);
  if GBEPlayerPosition.position.Y > pleMer.position.Y + 5 then begin
    if musique = repSons + ambianceMer then begin
      mpAmbiance.Stop;
      PlaySound(mpAmbiance, repSons + ambianceCricket);
      musique := repSons + ambianceCricket;
    end;
  end else begin
    if musique = repSons + ambianceCricket then begin
      mpAmbiance.Stop;
      PlaySound(mpAmbiance, repSons + ambianceMer);
      musique := repSons + ambianceMer;
    end;
  end;

  RePlaySound(mpAmbiance, musique); // on joue la musique d'ambiance en boucle

  // Animation de l'arme en fonction de la vitesse de déplacement
  if vitesse = 0 then aniPistolet.StopAtCurrent
  else begin
    if not(aniPistolet.Running) then aniPistolet.Start;
  end;

  // Game over lorsque le joueur n'a plus d'énergie ou que le temps est écoulé
  if (pointsVie = 0) or (heureFin - now < 0) then begin
    if pointsVie = 0 then label5.text := 'You are dead...'
    else label5.text := 'You did not find the exit in time...';
    aniCiel.Stop;
    SceneJeu := TSceneJeu.gameover;
  end;
end;

procedure TfMain.AfficherIntro;
begin
  if not(layIntro.Visible) then begin // si on arrive sur la scène d'intro
    MasquerLayouts;
    aniIntro.Start;
    aniIntro2.Start;
    aniVague.Start;
    aniIntroBouton.Start;
    PlaySound(mpAmbiance, repSons + musique);
    layIntro.Visible := true; // Affichage de l'écran
  end;
end;

procedure TfMain.AfficherMenu;
begin
  if not(layEcranMenu.Visible) then begin // si on arrive sur la scène menu
    MasquerLayouts;
    WaveEffect1.Parent := rAccueil;
    aniVague.Start;
    aniJambe.Start;
    aniJambeGauche.Start;
    layEcranMenu.Visible := true; // Affichage de l'écran
  end;
end;

procedure TfMain.AfficherOptions;
begin
  if not(layEcranOptions.Visible) then begin // si on arrive sur la scène options
    MasquerLayouts;
    WaveEffect1.Parent := rEcranOptions;
    aniVague.Start;
    layEcranOptions.Visible := true; // Affichage de l'écran
  end;
end;

procedure TfMain.AfficherGameOver;
begin
  if not(layGameover.Visible) then begin // si on arrive sur la scène game over
    MasquerLayouts;
    WaveEffect1.Parent := Rectangle3;
    aniVague.Start;
    layGameover.Visible := true;  // Affichage de l'écran
  end;
end;

procedure TfMain.AfficherVictoire;
var
  ficini: Tinifile;
begin
  if not(layVictoire.Visible) then begin  // si on arrive sur la scène victoire
    MasquerLayouts;
    WaveEffect1.Parent := Rectangle4;
    aniVague.Start;
    layVictoire.Visible := true; // Affichage de l'écran
  end;

  if (heureTerminee - heureDebut) < meilleurTemps then begin // Gestion du record
    meilleurTemps := heureTerminee - heureDebut;
    ficini := Tinifile.Create(fichierOptions);
    ficini.WriteTime('RECORD', 'meilleurTemps', meilleurTemps);
    ficini.WriteString('RECORD', 'os', TOSVersion.ToString);
    ficini.WriteDate('RECORD', 'date', now);
    ficini.Free;
  end;
  lblVictoireMessage.Text := 'Congratulations !!! You finished in ' + formatdatetime('nn:ss', heureTerminee - heureDebut) + #13#10
                             + 'Your best score is ' + formatdatetime('nn:ss', meilleurTemps) + '.';
  layVictoire.Visible := true;
end;

procedure TfMain.AfficherAide;
begin
  if not(layAide.Visible) then begin // si on arrive sur la scène aide
    MasquerLayouts;
    WaveEffect1.Parent := Rectangle5;
    aniVague.Start;
    layAide.Visible := true; // Affichage de l'écran
  end;
end;

procedure TfMain.AfficherHighScores;
begin
  if not(layHighScores.Visible) then begin // si on arrive sur la scène aide
    MasquerLayouts;
    WaveEffect1.Parent := Rectangle7;
    aniVague.Start;
    lblRecord.Text := 'Your best score is : ' + formatdatetime('nn:ss', meilleurTemps);
    layHighScores.Visible := true; // si on arrive sur la scène meilleurs scores
  end;
end;

procedure TfMain.MasquerLayouts;
begin
  layIntro.Visible := false;
  layEcranMenu.Visible := false;
  layGame.Visible := false;
  layEcranOptions.Visible := false;
  layVictoire.Visible := false;
  layGameover.Visible := false;
  layAide.Visible := false;
  layHighScores.Visible := false;
  aniIntro.Stop;
  aniVague.Stop;
  aniIntroBouton.Stop;
  aniJambe.Stop;
  aniJambeGauche.Stop;
  aniIntro2.Stop;
end;

procedure TfMain.rAideClick(Sender: TObject);
begin
  SceneJeu := TSceneJeu.aide;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  GBEJoystick1.MouseCapture := true;
  repSons := '.' + PathDelim + 'sons' + PathDelim;
  randomize;
  tmsMer.Texture := tileImage(tmsMer.Texture, 4, 4);
  ChargerConfig;
  AppliquerConfig;
  SceneJeu := TSceneJeu.intro;
  listeBalles := TList<TTir>.Create;

  jambeD.RotationCenter.Y := -1;
  jambeG.RotationCenter.Y := -1;

  aniPrincipale.Start;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  listeBalles.Free;
  listeAnimations.Free;
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  case keyboard of
    AZERTY:
      begin
        if (KeyChar = 'D') or (KeyChar = 'd') or (Key = 39) then TournerADroite;
        if (KeyChar = 'Q') or (KeyChar = 'q') or (Key = 37) then TournerAGauche;
        if (KeyChar = 'Z') or (KeyChar = 'z') or (Key = 38) then Avancer;
        if (KeyChar = 'S') or (KeyChar = 's') or (Key = 40) then Reculer;
        if KeyChar = ' ' then toucheTir := true;
        if (KeyChar = 'A') or (KeyChar = 'a') then decalerGauche;
        if (KeyChar = 'E') or (KeyChar = 'e') then decalerDroite;
      end;
    QWERTY:
      begin
        if (KeyChar = 'D') or (KeyChar = 'd') or (Key = 39) then TournerADroite;
        if (KeyChar = 'A') or (KeyChar = 'a') or (Key = 37) then TournerAGauche;
        if (KeyChar = 'W') or (KeyChar = 'w') or (Key = 38) then Avancer;
        if (KeyChar = 'S') or (KeyChar = 's') or (Key = 40) then Reculer;
        if KeyChar = ' ' then toucheTir := true;
        if (KeyChar = 'Q') or (KeyChar = 'q') then decalerGauche;
        if (KeyChar = 'E') or (KeyChar = 'e') then decalerDroite;
      end;
  end;

  if Key = 27 then vitesse := 0;  // Touche escape
end;

procedure TfMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  vitesseTouche := 0;
  case keyboard of
    AZERTY:
      begin
        if (KeyChar = 'D') or (KeyChar = 'd') or (Key = 39) then toucheDroite := false;
        if (KeyChar = 'Q') or (KeyChar = 'q') or (Key = 37) then toucheGauche := false;
        if (KeyChar = 'Z') or (KeyChar = 'z') or (Key = 38) then toucheAvancer := false;
        if (KeyChar = 'S') or (KeyChar = 's') or (Key = 40) then toucheReculer := false;
        if KeyChar = ' ' then begin
          toucheTir := false;
          tirPossible := true;
        end;
        if (KeyChar = 'A') or (KeyChar = 'a') then begin
          toucheCoteGauche := false;
          vitesse := 0;
        end;
        if (KeyChar = 'E') or (KeyChar = 'e') then begin
          toucheCoteDroit := false;
          vitesse := 0;
        end;
      end;
    QWERTY:
      begin
        if (KeyChar = 'D') or (KeyChar = 'd') or (Key = 39) then toucheDroite := false;
        if (KeyChar = 'A') or (KeyChar = 'a') or (Key = 37) then toucheGauche := false;
        if (KeyChar = 'W') or (KeyChar = 'w') or (Key = 38) then toucheAvancer := false;
        if (KeyChar = 'S') or (KeyChar = 's') or (Key = 40) then toucheReculer := false;
        if KeyChar = ' ' then begin
          toucheTir := false;
          tirPossible := true;
        end;
        if (KeyChar = 'Q') or (KeyChar = 'q') then begin
          toucheCoteGauche := false;
          vitesse := 0;
        end;
        if (KeyChar = 'E') or (KeyChar = 'e') then begin
          toucheCoteDroit := false;
          vitesse := 0;
        end;
      end;
  end;
end;

procedure TfMain.TournerADroite;
begin
  toucheGauche := false;
  vitesseTouche := maxAccelerationTouche;
  toucheDroite := true;
end;

procedure TfMain.TournerAGauche;
begin
  toucheDroite := false;
  vitesseTouche := maxAccelerationTouche;
  toucheGauche := true;
end;

procedure TfMain.Avancer;
begin
  toucheReculer := false;
  GererVitesseTouche(0.1);
  toucheAvancer := true;
end;

procedure TfMain.Rectangle1Click(Sender: TObject);
begin
  aniCiel.Stop;
  mpAmbiance.Stop;
  PlaySound(mpAmbiance, repSons + musique);
  SceneJeu := TSceneJeu.menu;
end;

procedure TfMain.Rectangle9Click(Sender: TObject);
var
  ficini: Tinifile;
begin
  meilleurTemps := incMinute(now, dureeJeu) - now;
  ficini := Tinifile.Create(fichierOptions);
  ficini.WriteTime('RECORD', 'meilleurTemps', meilleurTemps);
  ficini.Free;
end;

procedure TfMain.Reculer;
begin
  toucheAvancer := false;
  GererVitesseTouche(0.1);
  toucheReculer := true;
end;

procedure TfMain.decalerGauche;
begin
  toucheCoteDroit := false;
  GererVitesseTouche(0.1);
  toucheCoteGauche := true;
end;

procedure TfMain.decalerDroite;
begin
  toucheCoteGauche := false;
  GererVitesseTouche(0.1);
  toucheCoteDroit := true;
end;

procedure TfMain.GererTouches;
begin
  vitesse := GBEJoystick1.OrientationKeyManagement(toucheDroite, toucheGauche, toucheAvancer, toucheReculer, false, false, toucheCoteDroit, toucheCoteGauche, vitesseTouche, vitesse, vitesseMax);
  if toucheTir then Tirer;
end;

procedure TfMain.Image1Click(Sender: TObject);
begin
  aniCiel.Stop;
  SceneJeu := TSceneJeu.menu;
end;

procedure TfMain.imgRetourMenuClick(Sender: TObject);
begin
  aniCiel.Stop;
  mpAmbiance.Stop;
  PlaySound(mpAmbiance, repSons + musique);
  SceneJeu := TSceneJeu.menu;
end;

procedure TfMain.GererDeplacementJoueur;
var
  collision: TGBECollisionRetour;
begin
  GBEViewport3D.BeginUpdate;

  if toucheCoteDroit then
    GBEPlayerPosition.NextPosition.position.point := GBEPlayerPosition.position.point - GBEJoystick1.directionSidewayRight * vitesse
  else begin
    if toucheCoteGauche then
      GBEPlayerPosition.NextPosition.position.point := GBEPlayerPosition.position.point - GBEJoystick1.directionSidewayLeft * vitesse
    else
      GBEPlayerPosition.NextPosition.position.point := GBEPlayerPosition.position.point - GBEJoystick1.direction * vitesse;
  end;

  // Hautuer du joueur en fonction de la hauteur du heightmap à la position du joueur
  GBEPlayerPosition.NextPosition.position.Y := hSol.GetHeight(GBEPlayerPosition.NextPosition.position.point) + tailleJoueur + demiHauteur;

  if not(collisionDummyChilds(dmyEnnemis, GBEPlayerPosition.NextPosition).bool) then begin
    collision := collisionDummyChilds(dmyArbres, GBEPlayerPosition.NextPosition);
    if not(collision.bool) then begin
      GBEPlayerPosition.position.point := GBEPlayerPosition.NextPosition.position.point;
      detecterCollisionBonus; // Collision avec les bonus
    end else begin // Collision avec un obstacle
      RetournerPositionPrecedente;

      if collision.objet.Name = 'dmySortie' then begin // collision avec la porte de sortie
        if rIndice3.Visible then begin  // Si les 3 codes sont trouvés, alors victoire
          heureTerminee := now;
          SceneJeu := TSceneJeu.victoire;
        end else begin
          if rIndice2.Visible then
            lblMessage.Text := 'You need to find another one code...'
          else begin
            if rIndice1.Visible then
              lblMessage.Text := 'You need to find another two codes...'
            else
              lblMessage.Text := 'You need to find three codes...';
          end;
        end;
      end else begin // collision avec un arbre, on joue le son
        TTask.Create(
          procedure
          begin
            PlaySound(mpSons2, repSons + collisionArbre);
          end).Start;
      end;
    end;
  end else begin // Collision avec un ennemi
    RetournerPositionPrecedente;
    pointsVie := pointsVie - 5;
  end;

  GBEViewport3D.EndUpdate;
end;

// Retour à la position précédente (en cas de collision avec un obstacle)
procedure TfMain.RetournerPositionPrecedente;
begin
  GBEPlayerPosition.position.point := GBEPlayerPosition.position.point + GBEJoystick1.direction * vitesse;
  vitesse := 0;
end;

procedure TfMain.GererTir;
var
  balle: TTir;
  balleADetruire: boolean;
begin
  for balle in listeBalles do begin
    balleADetruire := false;
    balle.balle.position.point := balle.balle.position.point + balle.direction; // Nouvelle position de la balle
    if (balle.balle.position.point.X > (balle.positionDepart.X + balle.porteeTir)) or   // si la balle arrive à la portée du tir
      (balle.balle.position.point.X < (balle.positionDepart.X - balle.porteeTir)) or
      (balle.balle.position.point.Z > (balle.positionDepart.Z + balle.porteeTir)) or
      (balle.balle.position.point.Z < (balle.positionDepart.Z - balle.porteeTir)) then
      balleADetruire := true;
    if balle.balle.position.Y < hSol.GetHeight(balle.balle.position.point) then balleADetruire := true; // si la balle entre dans le sol

    if DetecterCollisionBalleEnnemis(balle.balle).bool then balleADetruire := true;  // si la balle touche un ennemi
    if collisionDummyChilds(dmyArbres, balle.balle).bool then balleADetruire := true;  // si la balle touche un obstacle

    if balleADetruire then begin  // Si la balle est à détruire, on la détruit
      balle.balle.Visible := false;
      balle.light.Free;
      listeBalles.Remove(balle);
    end;
  end;
end;

procedure TfMain.Tirer;
var
  balle: TTir;
begin
  if tirPossible then begin    // Si tir possible
    if nbBalles > 0 then begin   // Si on a au moins une munition
      tirPossible := false;
      balle.balle := TSphere.Create(nil);  // Création du projectile
      balle.balle.Parent := hSol;
      balle.vitesseTir := vitesseTir;
      balle.porteeTir := porteeTir;
      balle.balle.Width := 0.3;
      balle.balle.Height := 0.3;
      balle.balle.Depth := 0.3;
      balle.balle.MaterialSource := cmsBalle;
      balle.positionDepart := GBEPlayerPosition.position.point;
      balle.direction := GBEJoystick1.direction * balle.vitesseTir;
      balle.balle.position.point := balle.positionDepart;
      balle.light := TLight.Create(nil);
      balle.light.Parent := balle.balle;
      balle.light.lightType := TLightType.point;
      balle.light.SpotCutOff := 10;
      balle.light.SpotExponent := 0.1;
      balle.light.color := TAlphaColorRec.White;
      listeBalles.Add(balle);            // Ajout de la balle dans la liste des balles en cours
      dec(nbBalles);
      TTask.Create(
        procedure
        begin
          PlaySound(mpSons, repSons + sonTir);
        end).Start;
    end
    else
      TTask.Create(
        procedure
        begin
          PlaySound(mpSons, repSons + sonChargeurVide);
        end).Start;
  end;
end;

procedure TfMain.ChargerEnnemis;
var
  unEnnemi : TEnnemi;
  i : integer;
begin
  listeAnimations.Clear;

  for I := 0 to maxEnnemis-1 do begin  // Création des ennemis
    unEnnemi := TEnnemi.Create(nil);
    unEnnemi.Parent := dmyEnnemis;
    unEnnemi.corps.MaterialSource := lmsCorps;
    unEnnemi.brasGauche.MaterialSource := lmsBras;
    unEnnemi.brasDroit.MaterialSource := lmsBras;
    unEnnemi.jambeGauche.MaterialSource := lmsJambe;
    unEnnemi.jambeDroite.MaterialSource := lmsJambe;
    unEnnemi.tete.MaterialSource := lmsTete;
    unEnnemi.pointDeVie := maxEnnemiPointDeVie;
    unEnnemi.RotationAngle.Z := 180;

    unEnnemi.position.point := Point3D(random(700) - 350, 0, random(700) - 350);      // Position aléatoire du zombie
    if unEnnemi.position.X = GBEPlayerPosition.position.X then unEnnemi.position.X := random(700) - 350;  // Si la position de l'ennemi = position du joueur,
    if unEnnemi.position.Z = GBEPlayerPosition.position.X then unEnnemi.position.Z := random(700) - 350;  //    on calcule une autre position du zombi
    unEnnemi.position.Y := hSol.GetHeight(unEnnemi.position.point) + demiHauteurEnnemi;
    unEnnemi.Visible := true;
    unEnnemi.demarrerAnimationJambes;
    CreerAnimationDeplacement(unEnnemi);          // Ajout d'une animation pour le déplacement du zombie
  end;
end;

procedure TfMain.CreerAnimationDeplacement(objet: TControl3D);
var
  uneAnimation: TFloatAnimation;
begin
  uneAnimation := TFloatAnimation.Create(nil);
  uneAnimation.Parent := objet;
  uneAnimation.Interpolation := TInterpolationType.Linear;
  uneAnimation.AutoReverse := true;
  uneAnimation.Loop := true;
  uneAnimation.OnProcess := deplacerEnnemi;
  if random(10) mod 2 = 0 then begin                    // On crée une animation rectiligne sur l'axe X ou l'axe Z
    uneAnimation.PropertyName := 'Position.X';
    uneAnimation.StartValue := objet.position.X;
    uneAnimation.StopValue := uneAnimation.StartValue;
    while abs(uneAnimation.StopValue - uneAnimation.StartValue) < 40 do
      uneAnimation.StopValue := uneAnimation.StartValue + random(300) - 150;
    if uneAnimation.StartValue > uneAnimation.StopValue then objet.RotationAngle.Y := 90
    else objet.RotationAngle.Y := 270;
  end else begin
    uneAnimation.PropertyName := 'Position.Z';
    uneAnimation.StartValue := objet.position.Z;
    uneAnimation.StopValue := uneAnimation.StartValue;
    while abs(uneAnimation.StopValue - uneAnimation.StartValue) < 5 do
      uneAnimation.StopValue := uneAnimation.StartValue + random(300) - 150;
    if uneAnimation.StartValue > uneAnimation.StopValue then objet.RotationAngle.Y := 0
    else objet.RotationAngle.Y := 180;
  end;

  uneAnimation.Duration := random(8) * (abs(uneAnimation.StartValue - uneAnimation.StopValue) * 0.1) + 0.1 * abs(uneAnimation.StartValue - uneAnimation.StopValue);
  uneAnimation.Start;
  listeAnimations.Add(uneAnimation);
end;

procedure TfMain.deplacerEnnemi(Sender: TObject); // Animation du déplacement de l'ennemi
begin
  if (Sender is TFloatAnimation) then
  begin
    ((Sender as TFloatAnimation).Parent as TDummy).position.Y := hSol.GetHeight(((Sender as TFloatAnimation).Parent as TDummy).position.point) + demiHauteurEnnemi; // On calcule sa hauteur en fonction de sa position
  end;
end;

function TfMain.DetecterCollisionBalleEnnemis(balle: TSphere): TGBECollisionRetour;
begin
  result := collisionDummyChilds(dmyEnnemis, balle);  // Recherche collision avec les ennemis
  if result.bool then begin  // Si collision
    (result.objet as TEnnemi).PointDeVie := (result.objet as TEnnemi).PointDeVie - 1;
    case (result.objet as TEnnemi).PointDeVie of
      2:begin
          (result.objet as TEnnemi).Corps.MaterialSource := lmsEnnemiOrange;
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonEnnemiTouche);
            end).Start;
        end;
      1:begin
          (result.objet as TEnnemi).Corps.MaterialSource := lmsEnnemiRouge;
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonEnnemiTouche);
            end).Start;
        end;
      0:begin
          (result.objet as TEnnemi).Visible := false;
          (result.objet as TEnnemi).arreterAnimationJambes;
          dec(nbEnnemisRestants);
          heureFin := incSecond(heureFin, 30);
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonEnnemiMort);
            end).Start;
        end;
    end;
  end;
end;

procedure TfMain.ChargerArbres;
var
  I: integer;
begin
  arbre.position.point := Point3D(random(680) - 340, 0, random(680) - 340); // Placement aléatoire des obstacles (arbres)
{$IFDEF MACOS}
  arbre.WrapMode := TMeshWrapMode.original;
  arbre.Scale.Y := 0.5;
  arbre.position.Y := hSol.GetHeight(arbre.position.point) + demiHauteurArbre - arbre.Height * 0.5;
{$ELSE}
{$IFDEF LINUX64}
  arbre.WrapMode := TMeshWrapMode.original;
  arbre.Scale.Y := 0.5;
  arbre.position.Y := hSol.GetHeight(arbre.position.point) + demiHauteurArbre - arbre.Height * 0.5;
{$ELSE}
  arbre.position.Y := hSol.GetHeight(arbre.position.point) + demiHauteurArbre;
{$ENDIF}
{$ENDIF}
  arbre.RotationAngle.Y := random(360);
  arbre.Visible := true;
  arbre.Tag := 1;
  arbre.Parent := hSol;
  dmySortie.Parent := fMain;
  dmyArbres.DeleteChildren;
  arbre.Parent := dmyArbres;

  for I := 2 to MaxArbres do begin
    with (arbre.Clone(self) as TModel3D) do begin
      Parent := dmyArbres;
      position.point := Point3D(random(700) - 350, 0, random(700) - 350);
{$IFDEF MACOS}
      position.Y := hSol.GetHeight(position.point) + demiHauteurArbre - arbre.Height * 0.5;
{$ELSE}
{$IFDEF LINUX64}
      position.Y := hSol.GetHeight(position.point) + demiHauteurArbre - arbre.Height * 0.5;
{$ELSE}
      position.Y := hSol.GetHeight(position.point) + demiHauteurArbre;
{$ENDIF}
{$ENDIF}
      Visible := true;
      name := 'arbre' + I.ToString;
      Tag := 1;
    end;
  end;
end;

procedure TfMain.gererHerbe;
var
  distance: TPoint3D;
  aFaire: boolean;
begin
  aFaire := dmyHerbe.ChildrenCount = 0;
  if aFaire then GenererHerbe(maxHerbe - dmyHerbe.ChildrenCount);  // Génération de l'herbe autour du joueur au départ

  // Gestion aparition/disparition de l'herbe en fonction de la position du joueur
  TParallel.for(0, dmyHerbe.ChildrenCount - 1,
    procedure(I: integer)
    begin
      distance := TGBEGrass(dmyHerbe.children[I]).position.point - GBEPlayerPosition.position.point;
      if (abs(distance.X) > distanceAffichageHerbe) or (abs(distance.Y) > distanceAffichageHerbe) or
        (abs(distance.Z) > distanceAffichageHerbe) then
        ReplacerHerbe(TGBEGrass(dmyHerbe.children[I]));
    end);
end;

procedure TfMain.ReplacerHerbe(objet: TGBEGrass);
var
  hauteur: single;
begin
  objet.Visible := false;
  objet.position.point := GBEPlayerPosition.position.point + GBEJoystick1.direction * (demiDistanceAffichageHerbe + 2);
  objet.position.X := objet.position.X + random(distanceAffichageHerbe - 4) - demiDistanceAffichageHerbe;
  objet.position.Z := objet.position.Z + random(distanceAffichageHerbe - 4) - demiDistanceAffichageHerbe;

  objet.RotationAngle.Y := random(180);
  hauteur := hSol.GetHeight(objet.position.point) + objet.Height * demiHauteurHerbe;
  if hauteur > pleMer.position.Y + 2 then begin    // Pour éviter de placer de l'herbe sous le niveau de la mer
    objet.position.Y := hSol.GetHeight(objet.position.point) + objet.Height * demiHauteurHerbe;
    objet.Visible := true;
  end;
end;

procedure TfMain.rJouerClick(Sender: TObject);
begin
  SceneJeu := TSceneJeu.jeu;
end;

procedure TfMain.rOptionsClick(Sender: TObject);
begin
  aniCiel.Stop;
  SceneJeu := TSceneJeu.options;
end;

procedure TfMain.rOptionsOkClick(Sender: TObject);
begin
  aniCiel.Stop;
  EnregistrerConfig;
  AppliquerConfig;
  SceneJeu := TSceneJeu.menu;
end;

procedure TfMain.rScoresClick(Sender: TObject);
begin
  aniCiel.Stop;
  SceneJeu := TSceneJeu.highScores;
end;

procedure TfMain.GenererHerbe(nombre: integer);
var
  I: integer;
  p: TPoint3D;
begin
  for I := 1 to nombre do begin
    with TGBEGrass.Create(nil) do begin
      Visible := false;
      Parent := dmyHerbe;
      p.X := GBEPlayerPosition.position.X + demiDistanceAffichageHerbe - random(distanceAffichageHerbe);
      p.Z := GBEPlayerPosition.position.Z + demiDistanceAffichageHerbe - random(distanceAffichageHerbe);

      RotationAngle.Y := random(180);
      RotationAngle.X := 180;
      MaterialSource := lmsHerbe;

      Depth := 0;
      Width := 1;
      Height := Width;
      demiHauteurHerbe := Height * 0.5;
      p.Y := hSol.GetHeight(p) + demiHauteurHerbe;
      position.point := p;
      zWrite := true;
      Visible := true;
      wind := OptionsCommunes.activerHerbeVent;
      temps := random(30);
    end;
  end;
end;

procedure TfMain.LancerNouvellePartie;  // Initialisation d'une nouvelle partie
var
  Mesh: TMesh;
  balle: TTir;
begin
  for balle in listeBalles do begin
    balle.light.Free;
    listeBalles.Remove(balle);
  end;

  heureFin := incMinute(now, dureeJeu); // on initialise l'heure de fin (pour le chrono)
  heureDebut := now; // on initialise l'heure de début (pour le chrono)

  GBEJoystick1.Width := 0;
  GBEViewport3D.UsingDesignCamera := false;
  GBEViewport3D.Camera := GBEPlayerPosition.getCamera;

  PlaySound(mpAmbiance, repSons + ambianceMer);
  hSol.loadHeightmapFromResource('heightmap');
  vitesse := 0;
  demiHauteur := GBEPlayerPosition.Height * 0.5;
  GBEJoystick1.deplacement := Point3D(-1, 1, 1);

  toucheDroite := false;
  toucheGauche := false;
  toucheAvancer := false;
  toucheReculer := false;
  toucheTir := false;
  tirPossible := true;

  rIndice1.Visible := false;
  rIndice2.Visible := false;
  rIndice3.Visible := false;

  nbBalles := maxBalles;
  listeAnimations := TList<TFloatAnimation>.Create;
  nbEnnemisRestants := maxEnnemis;
  demiHauteurEnnemi := tailleEnnemi * 0.5;
  ChargerEnnemis;
  ChargerBonus;

  demiHauteurArbre := (arbre.Height) * 0.5;
  for Mesh in arbre.MeshCollection do
    Mesh.MaterialSource := lmsArbre;
  ChargerArbres;

  cameraCarte.position.Z := 0;
  pistolet.Parent := GBEPlayerPosition.getDummyOrientation;

  toucheCoteDroit := false;
  toucheCoteGauche := false;
  demiDistanceAffichageHerbe := distanceAffichageHerbe * 0.5;
  dmyHerbe.DeleteChildren;

  GBEPlayerPosition.position.point := Point3D(360, 0, -100); // Placement fixe du joueur (sur la plage)
  dmySortie.position.point := Point3D(random(700) - 350, 0, random(700) - 350);  // Placement aléatoire de la porte de sortie
  dmySortie.position.Y := hSol.GetHeight(dmySortie.position.point) + dmySortie.Height * 0.5;
  dmySortie.Parent := dmyArbres;  // La porte sera considérée comme un obstacle (comme les arbres)

  pointsVie := maxVie;
  aniCiel.Start;
end;

procedure TfMain.AppliquerConfig;  // Le joueur change les paramètres du jeu
begin
  GBEViewport3D.Multisample := OptionsCommunes.filtre;
  pleMer.ActiveWaves := OptionsCommunes.activerVagues;
  maxHerbe := OptionsCommunes.nbHerbe;
  pleMer.SubdivisionsHeight := 30;
  pleMer.SubdivisionsWidth := 30;
  GBEViewport3D.ActiveFPS := OptionsCommunes.afficherFPS;
  lblFPS.Visible := GBEViewport3D.ActiveFPS;

  hSol.ShowLines := OptionsCommunes.afficherLignes;

  case cbFiltre.ItemIndex of
    0:
      GBEViewport3D.Multisample := TMultisample.None;
    1:
      GBEViewport3D.Multisample := TMultisample.TwoSamples;
    2:
      GBEViewport3D.Multisample := TMultisample.FourSamples;
  end;
  case cbKeyboard.ItemIndex of
    0:
      keyboard := TKeyboardType.AZERTY;
    1:
      keyboard := TKeyboardType.QWERTY;
  end;
end;

procedure TfMain.EnregistrerConfig;  // Sauvegarde des paramètres
begin
  OptionsCommunes.activerVagues := cbAnimerMer.IsChecked;
  OptionsCommunes.afficherFPS := cbAfficherFPS.IsChecked;
  case cbFiltre.ItemIndex of
    0:
      OptionsCommunes.filtre := TMultisample.None;
    1:
      OptionsCommunes.filtre := TMultisample.TwoSamples;
    2:
      OptionsCommunes.filtre := TMultisample.FourSamples;
  end;
  case cbKeyboard.ItemIndex of
    0:
      OptionsCommunes.keyboard := TKeyboardType.AZERTY;
    1:
      OptionsCommunes.keyboard := TKeyboardType.QWERTY;
  end;
  OptionsCommunes.activerHerbe := cbHerbe.IsChecked;
  OptionsCommunes.activerHerbeVent := cbAnimerHerbe.IsChecked;
  OptionsCommunes.nbHerbe := Round(sbNbHerbe.Value);

  OptionsCommunes.sauverConfig(fichierOptions);
end;

procedure TfMain.ChargerConfig;  // Chargement des paramètres du jeu
var
  ficini: Tinifile;
begin
  fichierOptions := TPath.GetHomePath + PathDelim + 'LostNFound.cfg';
  OptionsCommunes.ChargerConfig(fichierOptions);
  cbAnimerMer.IsChecked := OptionsCommunes.activerVagues;
  cbAfficherFPS.IsChecked := OptionsCommunes.afficherFPS;
{$IFDEF ANDROID}
  cbAfficherBoutons.IsChecked := true;
{$ENDIF}
  cbHerbe.IsChecked := OptionsCommunes.activerHerbe;
  cbAnimerHerbe.IsChecked := OptionsCommunes.activerHerbeVent;
  sbNbHerbe.Value := OptionsCommunes.nbHerbe;
  ficini := Tinifile.Create(fichierOptions);
  meilleurTemps := ficini.ReadTime('RECORD', 'meilleurTemps', incMinute(now, dureeJeu) - now);
  ficini.Free;
  case OptionsCommunes.filtre of
    TMultisample.None:
      cbFiltre.ItemIndex := 0;
    TMultisample.TwoSamples:
      cbFiltre.ItemIndex := 1;
    TMultisample.FourSamples:
      cbFiltre.ItemIndex := 2;
  end;
  keyboard := OptionsCommunes.keyboard;
  case keyboard of
    QWERTY:
      cbKeyboard.ItemIndex := 1;
    AZERTY:
      cbKeyboard.ItemIndex := 0;
  end;
end;

procedure TfMain.ChargerBonus;
var
  I: integer;
  bonusMunition, bonusPointDeVie: TBonus;
begin
  dmyBonus.DeleteChildren;

  for I := 0 to nbBonusMunition - 1 do begin   // Placement aléatoire des bonus de munition
    bonusMunition.boite := TCube.Create(nil);
    bonusMunition.boite.Parent := dmyBonus;
    bonusMunition.boite.Width := taileBonus;
    bonusMunition.boite.Height := taileBonus;
    bonusMunition.boite.Depth := taileBonus;
    bonusMunition.boite.SubdivisionsDepth := 5;
    bonusMunition.boite.HitTest := false;
    bonusMunition.boite.SubdivisionsHeight := 5;
    bonusMunition.boite.SubdivisionsWidth := 5;
    bonusMunition.boite.RotationAngle.Z := 180;
    bonusMunition.boite.position.point := Point3D(random(700) - 350, 0, random(700) - 350);
    bonusMunition.boite.Tag := 2;
    bonusMunition.boite.position.Y := hSol.GetHeight(bonusMunition.boite.position.point) + (taileBonus * 0.5);
    bonusMunition.boite.RotationAngle.Y := random(360);
    bonusMunition.boite.Visible := true;
    bonusMunition.boite.MaterialSource := lmsBonusMunition;
    bonusMunition.boite.Name := 'bonusMunition' + I.ToString;
  end;

  for I := 0 to nbBonusPointDeVie - 1 do begin   // Placement aléatoire des bonus d'énergie
    bonusPointDeVie.boite := TCube.Create(nil);
    bonusPointDeVie.boite.Parent := dmyBonus;
    bonusPointDeVie.boite.Width := taileBonus;
    bonusPointDeVie.boite.HitTest := false;
    bonusPointDeVie.boite.Height := taileBonus;
    bonusPointDeVie.boite.Depth := taileBonus;
    bonusPointDeVie.boite.RotationAngle.Z := 180;
    bonusPointDeVie.boite.position.point := Point3D(random(700) - 350, 0, random(700) - 350);
    bonusPointDeVie.boite.Tag := 1;
    bonusPointDeVie.boite.position.Y := hSol.GetHeight(bonusPointDeVie.boite.position.point) + (taileBonus * 0.5);
    bonusPointDeVie.boite.RotationAngle.Y := random(360);
    bonusPointDeVie.boite.Visible := true;
    bonusPointDeVie.boite.MaterialSource := lmsBonusPointDeVie;
    bonusPointDeVie.boite.Name := 'bonusMunition' + I.ToString;
  end;

  for I := 0 to 2 do begin      // Placement aléatoire des codes
    bonusPointDeVie.boite := TCube.Create(nil);
    bonusPointDeVie.boite.Parent := dmyBonus;
    bonusPointDeVie.boite.Width := taileBonus;
    bonusPointDeVie.boite.Height := taileBonus;
    bonusPointDeVie.boite.Depth := taileBonus;
    bonusPointDeVie.boite.HitTest := false;
    bonusPointDeVie.boite.RotationAngle.Z := 180;
    bonusPointDeVie.boite.position.point := Point3D(random(700) - 350, 0, random(700) - 350);
    bonusPointDeVie.boite.Tag := 3;
    bonusPointDeVie.boite.position.Y := hSol.GetHeight(bonusPointDeVie.boite.position.point) + (taileBonus * 0.5);
    bonusPointDeVie.boite.hint := KeyRandom(5);
    bonusPointDeVie.boite.RotationAngle.Y := random(360);
    bonusPointDeVie.boite.Visible := true;
    bonusPointDeVie.boite.MaterialSource := lmsBonusIndice;
    bonusPointDeVie.boite.Name := 'bonusIndice' + I.ToString;
  end;
end;

procedure TfMain.detecterCollisionBonus;
var
  retour: TGBECollisionRetour;
begin
  retour := collisionDummyChilds(dmyBonus, GBEPlayerPosition);  // collision avec les bonus
  if retour.bool then begin
    retour.objet.Visible := false;
    case retour.objet.Tag of
      1:
        begin
          pointsVie := maxVie;
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonBonusEnergie);
            end).Start;
        end;
      2:
        begin
          nbBalles := maxBalles;
          aniPistoletRecharge.Start;
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonBonusMunition);
            end).Start;
        end;
      3:
        begin
          TTask.Create(
            procedure
            begin
              PlaySound(mpSons2, repSons + sonBonusCode);
            end).Start;
          if not(rIndice1.Visible) then begin
            rIndice1.Visible := true;
            lblIndice1.Text := retour.objet.hint;
          end else begin
            if not(rIndice2.Visible) then begin
              rIndice2.Visible := true;
              lblIndice2.Text := retour.objet.hint;
            end else begin
              rIndice3.Visible := true;
              lblIndice3.Text := retour.objet.hint;
            end;
          end;
        end;
    end;
  end;
end;

procedure TfMain.GererVitesseTouche(sensibilite: single);  // Gestion d'une inertie pour avancer et reculer
begin
  if vitesseTouche < maxAccelerationTouche then vitesseTouche := vitesseTouche + accelerationTouche * sensibilite;
end;

end.
