{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "epcnnfbjfcgphgdmggkamkmgojdagdnn"; } # uBlock Origin
      { id = "edibdbjcniadpccecjdfdjjppcpchdlm"; } # I still don't care about cookies
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # Sponsor Block
      { id = "ifnkdbpmgkdbfklnbfidaackdenlmhgh"; } # PopUpOFF
    ];
  };
}