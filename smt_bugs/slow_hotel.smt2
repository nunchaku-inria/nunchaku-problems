(set-option :produce-models true)
(set-option :interactive-mode true)
(set-logic ALL_SUPPORTED)
(declare-fun buggy () Bool)
(declare-datatypes () ((state (S6) (S5) (S4) (S3) (S2) (S1))))
(declare-datatypes () ((guest (G2) (G1))))
(declare-datatypes () ((option (Some (the guest)) (None))))
(declare-datatypes () ((room (R1))))
(declare-fun owns (state room) option)
(declare-datatypes () ((key (K4) (K3) (K2) (K1))))
(declare-fun currk (state room) key)
(declare-fun issued (state key) Bool)
(declare-datatypes () ((card (C5) (C4) (C3) (C2) (C1))))
(declare-fun cards (state guest card) Bool)
(declare-fun roomk (state room) key)
(declare-fun isin (state room guest) Bool)
(declare-fun safe (state room) Bool)
(declare-fun fst (card) key)
(declare-fun snd (card) key)
(declare-fun s () state)
(declare-fun r () room)
(declare-fun g () guest)
(declare-datatypes () ((_nat (_succ (_select__succ__0 _nat)) (_zero))))
(declare-fun decr_reach () _nat)
(declare-sort G_reach_pos 0)
(declare-fun __nun_card_witness_0 () G_reach_pos)
(declare-fun reach+ (_nat state) Bool)
(declare-fun proj_G_reach_pos_0 (G_reach_pos) _nat)
(declare-fun proj_G_reach_pos_1 (G_reach_pos) state)
(assert
 (forall ((a/340 G_reach_pos))
    (=> (reach+ (proj_G_reach_pos_0 a/340) (proj_G_reach_pos_1 a/340))
     (or
      (and
       (forall ((r1/1076 room))
          (= (owns (proj_G_reach_pos_1 a/340) r1/1076) None))
       (forall ((r1/1077 room))
          (forall ((rH/1078 room))
             (=>
              (= (currk (proj_G_reach_pos_1 a/340) r1/1077)
               (currk (proj_G_reach_pos_1 a/340) rH/1078))
              (= r1/1077 rH/1078))))
       (forall ((k/1079 key))
          (and
           (=> (issued (proj_G_reach_pos_1 a/340) k/1079)
            (exists ((r1/1085 room))
               (= (currk (proj_G_reach_pos_1 a/340) r1/1085) k/1079)))
           (=>
            (exists ((r1/1087 room))
               (= (currk (proj_G_reach_pos_1 a/340) r1/1087) k/1079))
            (issued (proj_G_reach_pos_1 a/340) k/1079))))
       (forall ((g1/1088 guest))
          (forall ((c/1089 card))
             (not (cards (proj_G_reach_pos_1 a/340) g1/1088 c/1089))))
       (forall ((r1/1090 room))
          (= (roomk (proj_G_reach_pos_1 a/340) r1/1090)
           (currk (proj_G_reach_pos_1 a/340) r1/1090)))
       (forall ((r1/1091 room))
          (forall ((g1/1092 guest))
             (not (isin (proj_G_reach_pos_1 a/340) r1/1091 g1/1092))))
       (forall ((r1/1093 room))
          (safe (proj_G_reach_pos_1 a/340) r1/1093))
       (is-_succ (proj_G_reach_pos_0 a/340)))
      (exists ((s1/1094 state))
         (exists ((K/1095 key))
            (exists ((C/1096 card))
               (exists ((R/1097 room))
                  (exists ((G/1098 guest))
                     (and
                      (reach+
                       (_select__succ__0 (proj_G_reach_pos_0 a/340))
                       s1/1094)
                      (exists ((a/1109 G_reach_pos))
                         (and (= s1/1094 (proj_G_reach_pos_1 a/1109))
                          (= (_select__succ__0 (proj_G_reach_pos_0 a/340))
                           (proj_G_reach_pos_0 a/1109))))
                      (not (issued s1/1094 K/1095))
                      (= (fst C/1096) (currk s1/1094 R/1097))
                      (= (snd C/1096) K/1095)
                      (forall ((r1/1110 room))
                         (= (owns (proj_G_reach_pos_1 a/340) r1/1110)
                          (ite (= r1/1110 R/1097) (Some G/1098)
                            (owns s1/1094 r1/1110))))
                      (forall ((r1/1111 room))
                         (= (currk (proj_G_reach_pos_1 a/340) r1/1111)
                          (ite (= r1/1111 R/1097) K/1095
                            (currk s1/1094 r1/1111))))
                      (forall ((k/1112 key))
                         (and
                          (=> (issued (proj_G_reach_pos_1 a/340) k/1112)
                           (or (= k/1112 K/1095) (issued s1/1094 k/1112)))
                          (=>
                           (or (= k/1112 K/1095) (issued s1/1094 k/1112))
                           (issued (proj_G_reach_pos_1 a/340) k/1112))))
                      (forall ((g1/1113 guest))
                         (forall ((c/1114 card))
                            (and
                             (=>
                              (cards (proj_G_reach_pos_1 a/340) g1/1113
                               c/1114)
                              (or
                               (and (= g1/1113 G/1098) (= c/1114 C/1096))
                               (cards s1/1094 g1/1113 c/1114)))
                             (=>
                              (or
                               (and (= g1/1113 G/1098) (= c/1114 C/1096))
                               (cards s1/1094 g1/1113 c/1114))
                              (cards (proj_G_reach_pos_1 a/340) g1/1113
                               c/1114)))))
                      (forall ((r1/1115 room))
                         (= (roomk (proj_G_reach_pos_1 a/340) r1/1115)
                          (roomk s1/1094 r1/1115)))
                      (forall ((r1/1116 room))
                         (forall ((g1/1117 guest))
                            (and
                             (=>
                              (isin (proj_G_reach_pos_1 a/340) r1/1116
                               g1/1117)
                              (isin s1/1094 r1/1116 g1/1117))
                             (=> (isin s1/1094 r1/1116 g1/1117)
                              (isin (proj_G_reach_pos_1 a/340) r1/1116
                               g1/1117)))))
                      (forall ((r1/1118 room))
                         (and
                          (=> (safe (proj_G_reach_pos_1 a/340) r1/1118)
                           (and (not (= r1/1118 R/1097))
                            (safe s1/1094 r1/1118)))
                          (=>
                           (and (not (= r1/1118 R/1097))
                            (safe s1/1094 r1/1118))
                           (safe (proj_G_reach_pos_1 a/340) r1/1118))))
                      (is-_succ (proj_G_reach_pos_0 a/340))))))))
      (exists ((s1/1119 state))
         (exists ((G/1120 guest))
            (exists ((C/1121 card))
               (exists ((K/1122 key))
                  (exists ((KH/1123 key))
                     (exists ((r1/1124 room))
                        (exists ((R/1125 room))
                           (and
                            (reach+
                             (_select__succ__0 (proj_G_reach_pos_0 a/340))
                             s1/1119)
                            (exists ((a/1200 G_reach_pos))
                               (and
                                (= s1/1119 (proj_G_reach_pos_1 a/1200))
                                (=
                                 (_select__succ__0
                                  (proj_G_reach_pos_0 a/340))
                                 (proj_G_reach_pos_0 a/1200))))
                            (cards s1/1119 G/1120 C/1121)
                            (= (fst C/1121) K/1122)
                            (= (snd C/1121) KH/1123)
                            (or (= (roomk s1/1119 r1/1124) K/1122)
                             (= (roomk s1/1119 r1/1124) KH/1123))
                            (forall ((ra/1201 room))
                               (=
                                (owns (proj_G_reach_pos_1 a/340) ra/1201)
                                (owns s1/1119 ra/1201)))
                            (forall ((ra/1202 room))
                               (=
                                (currk (proj_G_reach_pos_1 a/340) ra/1202)
                                (currk s1/1119 ra/1202)))
                            (forall ((k/1203 key))
                               (and
                                (=>
                                 (issued (proj_G_reach_pos_1 a/340)
                                  k/1203)
                                 (issued s1/1119 k/1203))
                                (=> (issued s1/1119 k/1203)
                                 (issued (proj_G_reach_pos_1 a/340)
                                  k/1203))))
                            (forall ((g1/1204 guest))
                               (forall ((c/1205 card))
                                  (and
                                   (=>
                                    (cards (proj_G_reach_pos_1 a/340)
                                     g1/1204 c/1205)
                                    (cards s1/1119 g1/1204 c/1205))
                                   (=> (cards s1/1119 g1/1204 c/1205)
                                    (cards (proj_G_reach_pos_1 a/340)
                                     g1/1204 c/1205)))))
                            (forall ((ra/1206 room))
                               (=
                                (roomk (proj_G_reach_pos_1 a/340) ra/1206)
                                (ite (= ra/1206 R/1125) KH/1123
                                  (roomk s1/1119 ra/1206))))
                            (forall ((ra/1207 room))
                               (forall ((g1/1208 guest))
                                  (and
                                   (=>
                                    (isin (proj_G_reach_pos_1 a/340)
                                     ra/1207 g1/1208)
                                    (or
                                     (and (= ra/1207 R/1125)
                                      (= g1/1208 G/1120))
                                     (isin s1/1119 ra/1207 g1/1208)))
                                   (=>
                                    (or
                                     (and (= ra/1207 R/1125)
                                      (= g1/1208 G/1120))
                                     (isin s1/1119 ra/1207 g1/1208))
                                    (isin (proj_G_reach_pos_1 a/340)
                                     ra/1207 g1/1208)))))
                            (forall ((ra/1209 room))
                               (and
                                (=>
                                 (safe (proj_G_reach_pos_1 a/340) ra/1209)
                                 (ite (= ra/1209 R/1125)
                                   (or
                                    (and
                                     (= (owns s1/1119 R/1125)
                                      (Some G/1120))
                                     (forall ((rb/1256 room))
                                        (forall ((g1/1257 guest))
                                           (not
                                            (isin s1/1119 rb/1256 g1/1257))))
                                     (or buggy
                                      (= KH/1123 (currk s1/1119 R/1125))))
                                    (safe s1/1119 R/1125))
                                   (safe s1/1119 ra/1209)))
                                (=>
                                 (ite (= ra/1209 R/1125)
                                   (or
                                    (and
                                     (= (owns s1/1119 R/1125)
                                      (Some G/1120))
                                     (forall ((rb/1272 room))
                                        (forall ((g1/1273 guest))
                                           (not
                                            (isin s1/1119 rb/1272 g1/1273))))
                                     (or buggy
                                      (= KH/1123 (currk s1/1119 R/1125))))
                                    (safe s1/1119 R/1125))
                                   (safe s1/1119 ra/1209))
                                 (safe (proj_G_reach_pos_1 a/340) ra/1209))))
                            (is-_succ (proj_G_reach_pos_0 a/340))))))))))
      (exists ((s1/1274 state))
         (exists ((R/1275 room))
            (exists ((G/1276 guest))
               (and
                (reach+ (_select__succ__0 (proj_G_reach_pos_0 a/340))
                 s1/1274)
                (exists ((a/1287 G_reach_pos))
                   (and (= s1/1274 (proj_G_reach_pos_1 a/1287))
                    (= (_select__succ__0 (proj_G_reach_pos_0 a/340))
                     (proj_G_reach_pos_0 a/1287))))
                (isin s1/1274 R/1275 G/1276)
                (forall ((r1/1288 room))
                   (= (owns (proj_G_reach_pos_1 a/340) r1/1288)
                    (owns s1/1274 r1/1288)))
                (forall ((r1/1289 room))
                   (= (currk (proj_G_reach_pos_1 a/340) r1/1289)
                    (currk s1/1274 r1/1289)))
                (forall ((k/1290 key))
                   (and
                    (=> (issued (proj_G_reach_pos_1 a/340) k/1290)
                     (issued s1/1274 k/1290))
                    (=> (issued s1/1274 k/1290)
                     (issued (proj_G_reach_pos_1 a/340) k/1290))))
                (forall ((g1/1291 guest))
                   (forall ((c/1292 card))
                      (and
                       (=>
                        (cards (proj_G_reach_pos_1 a/340) g1/1291 c/1292)
                        (cards s1/1274 g1/1291 c/1292))
                       (=> (cards s1/1274 g1/1291 c/1292)
                        (cards (proj_G_reach_pos_1 a/340) g1/1291 c/1292)))))
                (forall ((r1/1293 room))
                   (= (roomk (proj_G_reach_pos_1 a/340) r1/1293)
                    (roomk s1/1274 r1/1293)))
                (forall ((r1/1294 room))
                   (forall ((g1/1295 guest))
                      (and
                       (=>
                        (isin (proj_G_reach_pos_1 a/340) r1/1294 g1/1295)
                        (and
                         (or (not (= r1/1294 R/1275))
                          (not (= g1/1295 G/1276)))
                         (isin s1/1274 r1/1294 g1/1295)))
                       (=>
                        (and
                         (or (not (= r1/1294 R/1275))
                          (not (= g1/1295 G/1276)))
                         (isin s1/1274 r1/1294 g1/1295))
                        (isin (proj_G_reach_pos_1 a/340) r1/1294 g1/1295)))))
                (forall ((r1/1296 room))
                   (and
                    (=> (safe (proj_G_reach_pos_1 a/340) r1/1296)
                     (safe s1/1274 r1/1296))
                    (=> (safe s1/1274 r1/1296)
                     (safe (proj_G_reach_pos_1 a/340) r1/1296))))
                (is-_succ (proj_G_reach_pos_0 a/340))))))))))
(assert
 (not
  (=>
   (and (not buggy) (reach+ decr_reach s)
    (exists ((a/1304 G_reach_pos))
       (and (= s (proj_G_reach_pos_1 a/1304))
        (= decr_reach (proj_G_reach_pos_0 a/1304))))
    (safe s r) (isin s r g))
   (= (owns s r) (Some g)))))
(check-sat)
