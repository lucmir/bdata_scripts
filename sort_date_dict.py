


dict = {'9/7/2012': 1985988, '10/8/2012': 1739534, '20/8/2012': 2196344, '21/6/2012': 895, '27/7/2012': 2060795, '8/7/2012': 1368312, '8/8/2012': 1928107, '20/6/2012': 126, '4/8/2012': 1764294, '5/8/2012': 1575244, '3/8/2012': 1954017, '13/7/2012': 2127268, '28/6/2012': 1938002, '15/7/2012': 1401628, '15/8/2012': 1648154, '14/8/2012': 1865166, '29/7/2012': 1503626, '26/6/2012': 1951047, '30/7/2012': 2110563, '27/6/2012': 1897643, '24/7/2012': 2108882, '22/7/2012': 1314387, '29/6/2012': 1893865, '25/6/2012': 1881964, '23/6/2012': 3913, '25/7/2012': 2107542, '2/7/2012': 2047473, '12/8/2012': 1349352, '14/7/2012': 1551879, '22/6/2012': 1066, '18/7/2012': 2102535, '18/8/2012': 1437767, '23/7/2012': 2077300, '7/8/2012': 1855623, '16/8/2012': 1751414, '13/8/2012': 2049745, '3/7/2012': 2044193, '1/8/2012': 1937264, '4/7/2012': 1951709, '7/7/2012': 1581599, '12/7/2012': 2416967, '2/8/2012': 1992838, '24/6/2012': 1094646, '19/7/2012': 2243068, '5/7/2012': 2329662, '26/7/2012': 2100173, '31/7/2012': 2018480, '1/7/2012': 1359132, '9/8/2012': 1928503, '28/7/2012': 1464080, '30/6/2012': 1444921, '11/7/2012': 1995569, '17/7/2012': 2267858, '6/7/2012': 2091853, '20/7/2012': 1961351, '21/8/2012': 2178302, '19/8/2012': 1427903, '10/7/2012': 1970691, '22/8/2012': 1275795, '21/7/2012': 1407517, '11/8/2012': 1501483, '16/7/2012': 2319885, '17/8/2012': 1815134, '6/8/2012': 1954753}

for m in range(1, 13):
    for d in range(1, 32):
        key = '%d/%d/2012' % (d, m)
        if key in dict:
            print key, dict[key]

