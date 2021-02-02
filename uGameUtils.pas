unit uGameUtils;

interface
uses Generics.Collections, FMX.Objects3D, FMX.Types3d, System.Math.Vectors, System.UITypes, FMX.Controls3D,
     System.SysUtils, System.Math, FMX.Ani, system.classes;

type
  TSceneJeu = (intro, menu, jeu, options, gameover, victoire, aide, highScores);

  TEnnemi = class(TDummy)
    private
      fCorps, fBrasG, fBrasD, fJambeG, fJambeD : TCube;
      fTete : TSphere;
      fAniJambeD, fAniJambeG : TFloatAnimation;
      fPointDeVie : integer;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure demarrerAnimationJambes;
      procedure arreterAnimationJambes;

      property Corps : TCube read fCorps write fCorps;
      property BrasGauche : TCube read fBrasG write fBrasG;
      property BrasDroit : TCube read fBrasD write fBrasD;
      property JambeGauche : TCube read fJambeG write fJambeG;
      property JambeDroite : TCube read fJambeD write fJambeD;
      property Tete : TSphere read fTete write fTete;
      property PointDeVie : integer read fPointDeVie write fPointDeVie;
  end;

  TBonus = record
    boite : TCube;
    tag : integer;
  end;

  TTir = record
    porteeTir, vitesseTir : single;
    balle : TSphere;
    light: TLight;
    direction, positionDepart : TPoint3D;
  end;

  function KeyRandom(const aLen: integer): string;

const
  tailleJoueur = 1.5;
  accelerationTouche = 0.1;
  maxAccelerationTouche = 2;
  vitesseMax = 0.4;
  maxBalles = 10;
  vitesseTir = 1.7;
  porteeTir = 130;
  maxEnnemis = 10;
  MaxArbres = 100;
  distanceAffichageHerbe = 40;
  maxVie = 100;
  tailleEnnemi = 3;
  maxEnnemiPointDeVie = 3;
  nbBonusMunition = 7;
  taileBonus = 2;
  nbBonusPointDeVie = 4;
  dureeJeu = 5;
  musique = 'tgfcoder-FrozenJam-SeamlessLoop.mp3';
  ambianceCricket = 'cricketsounds090613.mp3';
  ambianceMer = 'vagues.mp3';
  collisionArbre = 'zap1.mp3';
  sonTir = 'laser5.mp3';
  sonChargeurVide = 'Blip.mp3';
  sonEnnemiTouche = 'phaserUp4.mp3';
  sonEnnemiMort = 'spaceTrash1.mp3';
  sonBonusEnergie = 'lowRandom.mp3';
  sonBonusMunition = 'powerUp7.mp3';
  sonBonusCode = 'powerUp8.mp3';

var
  maxHerbe : integer;

implementation

function KeyRandom(const aLen: integer): string;
begin
  result := EmptyStr;
  if aLen < 1 then
    Exit;
  repeat
    result := result + Chr(RandomRange(Ord('A'), Ord('Z') + 1));
  until Length(result) = aLen;
end;

{ TEnnemi }

constructor TEnnemi.Create(AOwner: TComponent);
begin
  inherited;

  Depth := 0.5;
  Height := 3;
  Width := 1.5;
  HitTest := false;

  fCorps  := TCube.Create(nil);
  fCorps.Parent := self;
  fCorps.Depth := 0.5;
  fCorps.Height := 1;
  fCorps.width := 1;
  fCorps.HitTest := false;

  fBrasD  := TCube.Create(nil);
  fBrasD.Parent := fCorps;
  fBrasD.depth := 0.25;
  fBrasD.Height := 1;
  fBrasD.width := 0.25;
  fBrasD.position.X := 0.5;
  fBrasD.position.Y := -0.35;
  fBrasD.position.Z := 0.5;
  fBrasD.RotationAngle.X := 90;
  fBrasD.HitTest := false;

  fBrasG  := TCube.Create(nil);
  fBrasG.Parent := fCorps;
  fBrasG.depth := 0.25;
  fBrasG.Height := 1;
  fBrasG.width := 0.25;
  fBrasG.position.X := -0.5;
  fBrasG.position.Y := -0.35;
  fBrasG.position.Z := 0.5;
  fBrasG.RotationAngle.X := 90;
  fBrasG.HitTest := false;

  fJambeD  := TCube.Create(nil);
  fJambeD.Parent := fCorps;
  fJambeD.depth := 0.35;
  fJambeD.Height := 1;
  fJambeD.width := 0.35;
  fJambeD.position.X := 0.35;
  fJambeD.position.Y := 1;
  fJambeD.position.Z := 0;
  fJambeD.HitTest := false;
  fJambeD.RotationCenter.Y := -1;

  fAniJambeD := TFloatAnimation.Create(nil);
  fAniJambeD.Parent := fJambeD;
  fAniJambeD.AutoReverse := true;
  fAniJambeD.Duration := 0.5;
  fAniJambeD.Loop := true;
  fAniJambeD.PropertyName := 'RotationAngle.X';
  fAniJambeD.StartValue := -15;
  fAniJambeD.StopValue := 15;

  fJambeG  := TCube.Create(nil);
  fJambeG.Parent := fCorps;
  fJambeG.depth := 0.35;
  fJambeG.Height := 1;
  fJambeG.width := 0.35;
  fJambeG.position.X := -0.35;
  fJambeG.position.Y := 1;
  fJambeG.position.Z := 0;
  fJambeG.HitTest := false;
  fJambeG.RotationCenter.Y := -1;

  fAniJambeG := TFloatAnimation.Create(nil);
  fAniJambeG.Parent := fJambeG;
  fAniJambeG.AutoReverse := true;
  fAniJambeG.Duration := 0.5;
  fAniJambeG.Loop := true;
  fAniJambeG.Inverse := true;
  fAniJambeG.PropertyName := 'RotationAngle.X';
  fAniJambeG.StartValue := -15;
  fAniJambeG.StopValue := 15;

  fTete := TSphere.Create(nil);
  fTete.Parent :=fCorps;
  fTete.depth := 1;
  fTete.height := 1;
  fTete.width := 1;
  fTete.position.Y := -1;
  fTete.rotationAngle.Y := 90;
  fTete.HitTest := false;

  fPointDeVie := 0;
end;

procedure TEnnemi.demarrerAnimationJambes;
begin
  fAniJambeD.Start;
  fAniJambeG.Start;
end;

procedure TEnnemi.arreterAnimationJambes;
begin
  fAniJambeD.Stop;
  fAniJambeG.Stop;
end;

destructor TEnnemi.Destroy;
begin
  fAniJambeD.Stop;
  fAniJambeG.Stop;
  inherited;
end;

end.
