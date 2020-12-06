/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Yasamin/Documents/Classes/COE758/Spartan3E-master/VGAController.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0158028915_3212880686_p_0(char *t0)
{
    char t8[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int t20;

LAB0:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3792);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(58, ng0);
    t4 = (t0 + 1992U);
    t9 = *((char **)t4);
    t4 = (t0 + 6736U);
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t8, t9, t4, 1);
    t11 = (t8 + 12U);
    t12 = *((unsigned int *)t11);
    t13 = (1U * t12);
    t14 = (10U != t13);
    if (t14 == 1)
        goto LAB8;

LAB9:    t15 = (t0 + 3872);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 10U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3936);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4000);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 6736U);
    t1 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t4, t2, 799);
    if (t1 != 0)
        goto LAB10;

LAB12:
LAB11:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 6720U);
    t1 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t4, t2, 524);
    if (t1 != 0)
        goto LAB15;

LAB17:
LAB16:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 6736U);
    t20 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t2);
    t1 = (t20 < 96);
    if (t1 != 0)
        goto LAB18;

LAB20:
LAB19:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 6720U);
    t20 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t2);
    t1 = (t20 < 2);
    if (t1 != 0)
        goto LAB21;

LAB23:
LAB22:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 4128);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 4192);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t1;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 4256);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 10U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 4320);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 10U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_size_not_matching(10U, t13, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(63, ng0);
    t5 = (t0 + 1832U);
    t9 = *((char **)t5);
    t5 = (t0 + 6720U);
    t10 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t8, t9, t5, 1);
    t11 = (t8 + 12U);
    t12 = *((unsigned int *)t11);
    t13 = (1U * t12);
    t3 = (10U != t13);
    if (t3 == 1)
        goto LAB13;

LAB14:    t15 = (t0 + 4064);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 10U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 6783);
    t5 = (t0 + 3872);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 10U);
    xsi_driver_first_trans_fast(t5);
    goto LAB11;

LAB13:    xsi_size_not_matching(10U, t13, 0);
    goto LAB14;

LAB15:    xsi_set_current_line(69, ng0);
    t5 = (t0 + 6793);
    t10 = (t0 + 4064);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 10U);
    xsi_driver_first_trans_fast(t10);
    goto LAB16;

LAB18:    xsi_set_current_line(73, ng0);
    t5 = (t0 + 3936);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    goto LAB19;

LAB21:    xsi_set_current_line(77, ng0);
    t5 = (t0 + 4000);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    goto LAB22;

}


extern void work_a_0158028915_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0158028915_3212880686_p_0};
	xsi_register_didat("work_a_0158028915_3212880686", "isim/RGB_test_isim_beh.exe.sim/work/a_0158028915_3212880686.didat");
	xsi_register_executes(pe);
}
