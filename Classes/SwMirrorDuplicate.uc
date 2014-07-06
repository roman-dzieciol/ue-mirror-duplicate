//=============================================================================
// SwMirrorDuplicate.
//=============================================================================
class SwMirrorDuplicate extends BrushBuilder
    config;

var() config vector LocMult;
var() config vector RotMult;
var() config vector ScaleMult;

event bool Build()
{
    local Actor A,D;
    local vector L,S;
    local rotator R;

    foreach AllObjects(class'Actor', A)
        if( A.bSelected )
            break;

    if( !A.bSelected )
        return false;

    A.ConsoleCommand("Actor Duplicate");

    foreach AllObjects(class'Actor', D)
        if( D.bSelected )
            break;

    if( !D.bSelected )
        return false;

    Log( "SwMirrorDuplicate" @A.name @D.name );

    R.Pitch = A.Rotation.Pitch * RotMult.X; 
    R.Yaw = A.Rotation.Yaw * RotMult.Y; 
    R.Roll = A.Rotation.Roll * RotMult.Z;
    D.SetRotation(R);
    
    S = A.DrawScale3D * ScaleMult;
    D.SetDrawScale3D(S);
    
    L = A.Location * LocMult;
    D.SetLocation(L);
    
    SaveConfig();
    
    return true;
}

DefaultProperties
{
	ToolTip="SwMirrorDuplicate"
    LocMult=(X=1,Y=1,Z=1)
    RotMult=(X=1,Y=1,Z=1)
    ScaleMult=(X=1,Y=1,Z=1)
}