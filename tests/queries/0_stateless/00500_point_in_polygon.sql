SELECT 'inner';
SELECT pointInPolygon((3., 3.), [(6, 0), (8, 4), (5, 8), (0, 2), (6, 0)]);
SELECT 'outer';
SELECT pointInPolygon((0.1, 0.1), [(6., 0.), (8., 4.), (5., 8.), (0., 2.), (6., 0.)]);
SELECT 'single line';
SELECT pointInPolygon((4.1, 0.1), [(6., 0.), (8., 4.), (5., 8.), (0., 2.), (6., 0.)]);
SELECT pointInPolygon((4.9, 0.9), [(6., 0.), (8., 4.), (5., 8.), (0., 2.), (6., 0.)]);
SELECT 'shifted grid';
SELECT pointInPolygon((0., 0.), [(6., 1.), (8., 4.), (5., 8.), (1., 2.), (6., 1.)]);
SELECT pointInPolygon((6., 5.), [(6., 1.), (8., 4.), (5., 8.), (1., 2.), (6., 1.)]);

SELECT 'pair of lines, single polygon';
SELECT pointInPolygon((0.1, 0.1), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);
SELECT pointInPolygon((0.9, 0.1), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);
SELECT pointInPolygon((0.1, 0.9), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);
SELECT pointInPolygon((2.2, 2.2), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);
SELECT pointInPolygon((2.1, 2.9), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);
SELECT pointInPolygon((2.9, 2.1), [(0., 0.), (8., 7.), (7., 8.), (0., 0.)]);

SELECT 'pair of lines, different polygons';
SELECT pointInPolygon((0.1, 0.1), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((1., 1.), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((0.7, 0.1), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((0.1, 0.7), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((1.1, 0.1), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((0.1, 1.1), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((5.0, 5.0), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }
SELECT pointInPolygon((7.9, 7.9), [(0.5, 0.), (1.0, 0.), (8.0, 7.5), (7.5, 8.0), (0., 1.), (0., 0.5), (4.5, 5.5), (5.5, 4.5), (0.5, 0.0)]); -- { serverError BAD_ARGUMENTS }

SELECT 'complex polygon';
SELECT pointInPolygon((0.05, 0.05), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);
SELECT pointInPolygon((0.15, 0.15), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);
SELECT pointInPolygon((0.3, 0.4), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);
SELECT pointInPolygon((0.4, 0.7), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);
SELECT pointInPolygon((0.7, 0.6), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);
SELECT pointInPolygon((0.9, 0.1), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1.0, 0.0), (8.0, 7.0), (7.0, 8.0), (0., 1.)]);

SELECT 'polygon with holes';
SELECT pointInPolygon((1., 1.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (3., 5.), (5., 5.), (5., 3.)]);
SELECT pointInPolygon((2.5, 2.5), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (3., 5.), (5., 5.), (5., 3.)]);
SELECT pointInPolygon((4., 4.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (3., 5.), (5., 5.), (5., 3.)]);
SELECT pointInPolygon((4., 2.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (3., 5.), (5., 5.), (5., 3.)]);
SELECT pointInPolygon((9., 9.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (3., 5.), (5., 5.), (5., 3.)]);

SELECT pointInPolygon((0.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((1.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((2.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((3.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((4.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((5.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);
SELECT pointInPolygon((6.5, 1.5), [(0., 0.), (7., 0.), (7., 3.), (0., 3.)], [(1., 1.), (2., 1.), (2., 2.), (1., 2.)], [(3., 1.), (4., 1.), (4., 2.), (3., 2.)], [(5., 1.), (6., 1.), (6., 2.), (5., 2.)]);

SELECT 'polygons with reversed direction';
SELECT pointInPolygon((4.1, .1), [(6., 0.), (0., 2.), (5., 8.), (8., 4.)]);
SELECT pointInPolygon((4.1, .9), [(6., 0.), (0., 2.), (5., 8.), (8., 4.)]);

SELECT pointInPolygon((1., 1.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (5., 3.), (5., 5.), (3., 5.)]);
SELECT pointInPolygon((2.5, 2.5), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (5., 3.), (5., 5.), (3., 5.)]);
SELECT pointInPolygon((4., 4.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (5., 3.), (5., 5.), (3., 5.)]);
SELECT pointInPolygon((4., 2.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)], [(3., 3.), (5., 3.), (5., 5.), (3., 5.)]);
SELECT pointInPolygon((9., 9.), [(4., 0.), (8., 4.), (4., 8.), (0., 4.)],[(3., 3.), (5., 3.), (5., 5.), (3., 5.)]);


SELECT 'eps for complex polygon in grid';
SELECT pointInPolygon((0., 0.), [(0., 1.), (0.2, 0.5), (0.6, 0.5), (0.8, 0.8), (0.8, 0.3), (0.1, 0.3), (0.1, 0.1), (0.8, 0.1), (1., 0.), (-6., -7.), (-7., -6.), (0., 1.)])
