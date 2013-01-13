
db.bigdata_player_session.group(
{
    keyf: function(doc) {
        var date = new Date(doc.creation_time);
        print(date)
        var dateKey = (date.getMonth()+1)+"/"+date.getDate()+"/"+date.getFullYear()+'';
        return {'day':dateKey};
    },
    cond: { creation_time : { $gte : 1344826800000, $lt: 1345431600000 }},
    initial: {count:0},
    reduce: function(obj, prev) {prev.count++;}
});

