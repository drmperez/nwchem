      subroutine gw_analytic_addrpa(rpa,eia,mynpoles,lpole)
c
c     Adds squared eigenvalue differences to diagonal of
c     RPA matrix. Each rank has all columns and only a
c     subset of rows.

      implicit none
      integer,intent(in) :: mynpoles,lpole
      double precision,intent(in) :: eia(mynpoles)
      double precision,intent(out) :: rpa(mynpoles,*)

      integer ipole

!$omp parallel do simd
      do ipole=lpole,lpole+mynpoles-1
        rpa(ipole-lpole+1,ipole) = rpa(ipole-lpole+1,ipole) +
     $                             eia(ipole-lpole+1)**2   
      enddo
!$omp end parallel do simd

      end subroutine