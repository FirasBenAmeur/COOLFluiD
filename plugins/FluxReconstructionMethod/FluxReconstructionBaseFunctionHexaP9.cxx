//#include "FluxReconstructionMethod/HexaFluxReconstructionElementData.hh"
#include "FluxReconstructionMethod/FluxReconstructionBaseFunctionHexaP9.hh"

//////////////////////////////////////////////////////////////////////////////

namespace COOLFluiD {

  namespace FluxReconstructionMethod {

//////////////////////////////////////////////////////////////////////////////

CFuint FluxReconstructionBaseFunctionHexaP9::_interpolatorID = 0;
RealVector FluxReconstructionBaseFunctionHexaP9::m_ksiFac = RealVector(10);
RealVector FluxReconstructionBaseFunctionHexaP9::m_etaFac = RealVector(10);
RealVector FluxReconstructionBaseFunctionHexaP9::m_ztaFac = RealVector(10);
RealVector FluxReconstructionBaseFunctionHexaP9::m_solPnts1D = RealVector(10);

//////////////////////////////////////////////////////////////////////////////

FluxReconstructionBaseFunctionHexaP9::FluxReconstructionBaseFunctionHexaP9()
{
  FluxReconstructionElementData* frElemData = new HexaFluxReconstructionElementData(getInterpolatorOrder());

  Common::SafePtr< std::vector< CFreal > > solPnts1D = frElemData->getSolPntsLocalCoord1D();

  const CFuint nbrSolPnts = solPnts1D->size();
  cf_assert(nbrSolPnts == m_solPnts1D.size());
  for (CFuint iSol = 0; iSol < nbrSolPnts; ++iSol)
  {
    m_solPnts1D[iSol] = (*solPnts1D)[iSol];
  }

  delete frElemData;
}

//////////////////////////////////////////////////////////////////////////////

void FluxReconstructionBaseFunctionHexaP9::computeFaceJacobianDeterminant(
        const std::vector<RealVector>& mappedCoord,
        const std::vector<Framework::Node*>& nodes,
        const Framework::IntegratorPattern& pattern,
              std::vector<RealVector>& faceJacobian)
{
    throw Common::ShouldNotBeHereException (FromHere(),"FR base functions should not be used as geometrical shape functions.");
}

//////////////////////////////////////////////////////////////////////////////

RealVector FluxReconstructionBaseFunctionHexaP9::computeMappedCoordinates(const RealVector& coord,
                                    const std::vector<Framework::Node*>& nodes)
{
  throw Common::ShouldNotBeHereException (FromHere(),"FR base functions should not be used as geometrical shape functions.");
}

//////////////////////////////////////////////////////////////////////////////

RealVector FluxReconstructionBaseFunctionHexaP9::computeMappedCoordinatesPlus1D(const RealVector& coord,
                                    const std::vector<Framework::Node*>& nodes)
{
  throw Common::ShouldNotBeHereException (FromHere(),"FR base functions should not be used as geometrical shape functions.");
}

//////////////////////////////////////////////////////////////////////////////

  } // namespace FluxReconstructionMethod

} // namespace COOLFluiD

//////////////////////////////////////////////////////////////////////////////
