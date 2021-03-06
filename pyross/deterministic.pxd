import  numpy as np
cimport numpy as np
cimport cython

ctypedef np.float_t DTYPE_t

cdef class CommonMethods:
    cdef:
        readonly int N, M, kI, kE, nClass
        readonly double gIh, gIc, fh, ep, gI
        readonly double gIsp, gIcp, gIhp
        readonly np.ndarray rp0, Ni, dxdt, CM, FM
        readonly np.ndarray population, sa, iaa, hh, cc, mm, alpha
        readonly dict paramList, readData

    cpdef set_contactMatrix(self, double t, contactMatrix)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SIR(CommonMethods):
    """
    Susceptible, Infected, Removed (SIR)

    * Ia: asymptomatic
    * Is: symptomatic
    """

    cdef:
        readonly np.ndarray beta, gIa, gIs, fsa

    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SIRS(CommonMethods):
    """
    Susceptible, Infected, Removed, Susceptible (SIRS)

    * Ia: asymptomatic
    * Is: symptomatic
    """
    cdef:
        readonly double beta, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEIR(CommonMethods):
    """
    Susceptible, Exposed, Infected, Removed (SEIR)

    * Ia: asymptomatic
    * Is: symptomatic
    """
    cdef:
        readonly np.ndarray beta, gIa, gIs, gE, fsa
    cpdef rhs(self, rp, tt)

@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEI8R(CommonMethods):
    """
    Susceptible, Exposed, Infected, Removed (SEIR). The infected class has 5 groups.

    * Ia: asymptomatic
    * Is: symptomatic
    * Ih: hospitalized
    * Ic: ICU
    * Im: Mortality

    The transitions are,

    * S  ---> E
    * E  ---> Ia, Is
    * Ia ---> R
    * Is ---> Is',Ih, R
    * Ih ---> Ih',Ic, R
    * Ic ---> Ic',Im, R
    """

    cdef:
        readonly double beta, gE, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)





@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SIkR(CommonMethods):
    """
    Susceptible, Infected, Removed (SIkR). Method of k-stages of I
    """
    cdef:
        readonly double beta, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEkIkR(CommonMethods):
    """
    Susceptible, Infected, Removed (SIkR). Method of k-stages of I

    See: Lloyd, Theoretical Population Biology 60, 59􏰈71 (2001), doi:10.1006􏰅tpbi.2001.1525.
    """
    cdef:
        readonly double beta, gE, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEkIkIkR(CommonMethods):
    """
    Susceptible, Infected, Removed (SIkR). Method of k-stages of I

    See: Lloyd, Theoretical Population Biology 60, 59􏰈71 (2001), doi:10.1006􏰅tpbi.2001.1525.
    """
    cdef:
        readonly double beta, gE, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEAIR(CommonMethods):
    """
    Susceptible, Exposed, Asymptomatic and infected, Infected, Removed (SEAIR)

    * Ia: asymptomatic
    * Is: symptomatic
    * E: exposed
    * A : Asymptomatic and infectious
    """
    cdef:
        readonly double beta, gE, gA, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEAI8R(CommonMethods):
    """
    Susceptible, Exposed, Activates, Infected, Removed (SEAIR). The infected class has 5 groups:

    * Ia: asymptomatic
    * Is: symptomatic
    * Ih: hospitalized
    * Ic: ICU
    * Im: Mortality

    The transitions are,

    * S  ---> E
    * E  ---> A
    * A  ---> Ia, Is
    * Ia ---> R
    * Is ---> Ih, Is', R
    * Ih ---> Ic, Ih', R
    * Ic ---> Im, Ic', R
    """
    cdef:
        readonly double beta, gE, gA, gIa, gIs, fsa
    cpdef rhs(self, rp, tt)




@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEAIRQ(CommonMethods):
    """
    Susceptible, Exposed, Asymptomatic and infected, Infected, Removed, Quarantined (SEAIRQ)

    * Ia: asymptomatic
    * Is: symptomatic
    * E: exposed
    * A: Asymptomatic and infectious
    * R: removed (recovered or deceased)
    * Q: quarantined
    """

    cdef:
        readonly np.ndarray beta, gE, gA, gIs, gIa, fsa
        readonly np.ndarray tS, tE, tA, tIa, tIs
    cpdef rhs(self, rp, tt)

@cython.wraparound(False)
@cython.boundscheck(False)
@cython.cdivision(True)
@cython.nonecheck(False)
cdef class SEAIRQ_testing(CommonMethods):
    """
    Susceptible, Exposed, Asymptomatic and infected, Infected, Removed, Quarantined (SEAIRQ)

    * Ia: asymptomatic
    * Is: symptomatic
    * E: exposed
    * A: Asymptomatic and infectious
    * R: removed (recovered or deceased)
    * Q: quarantined
    """

    cdef:
        readonly np.ndarray beta, gE, gA, gIa, gIs, fsa
        readonly np.ndarray ars, kapE
        readonly object testRate
    cpdef rhs(self, rp, tt)
    cpdef set_testRate(self, testRate)




@cython.wraparound(False)
@cython.boundscheck(True)
@cython.cdivision(False)
@cython.nonecheck(True)
cdef class Spp(CommonMethods):
    """
    Given a model specification, the Spp class generates a custome-made compartment epidemic model.
    """

    cdef:
        readonly np.ndarray constant_terms, linear_terms, infection_terms
        readonly np.ndarray parameters
        readonly list param_keys
        readonly dict class_index_dict
        readonly np.ndarray _lambdas

    cpdef rhs(self, rp, tt)


@cython.wraparound(False)
@cython.boundscheck(True)
@cython.cdivision(False)
@cython.nonecheck(True)
cdef class SppQ(CommonMethods):
    """
    Given a model specification, the SppQ class generates a custome-made model just like Spp, but automatically adds a quarantined version of every compartment
    """

    cdef:
        readonly np.ndarray constant_terms, linear_terms, infection_terms, test_pos, test_freq
        readonly np.ndarray parameters
        readonly list param_keys
        readonly dict class_index_dict
        readonly np.ndarray _lambdas
        readonly int nClassU
        readonly object testRate

    cpdef rhs(self, rp, tt)
    cpdef set_testRate(self, testRate)
