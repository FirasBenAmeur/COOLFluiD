#include "Common/COOLFluiD.hh"
#include "MathTools/CFVec.hh"

//////////////////////////////////////////////////////////////////////////////

/**
 * This structs model a Particle
 *
 * @author Pedro Santos
 * @author Alessandro Sanna
 * @author Andrea Lani
 */

//////////////////////////////////////////////////////////////////////////////

namespace COOLFluiD {

namespace LagrangianSolver {

//////////////////////////////////////////////////////////////////////////////

struct CommonData{
  MathTools::CFVec<CFreal,3> direction;
  MathTools::CFVec<CFreal,3> currentPoint;
  CFuint cellID;
};

//////////////////////////////////////////////////////////////////////////////

template<class UserData1>
struct Particle
{
  CommonData commonData;
  UserData1 userData;
};

//////////////////////////////////////////////////////////////////////////////

}

}
