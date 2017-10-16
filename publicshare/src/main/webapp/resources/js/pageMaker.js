function PageMaker(param){
    var tag = "<li>%page</li>"; 
    var total = param.total;
    var current = param.current || 1;
    var showCount = param.showCount || 10;
    var liCount = param.liCount || 10;

    var tempEnd = (function(){
        return Math.ceil(current / liCount) * liCount;
    })();

    var startPage = (function(){
        return tempEnd - (liCount - 1);
    })();

    var endPage = (function(){
        var realEnd = Math.ceil(total / showCount);
        return tempEnd > realEnd ? realEnd : tempEnd;
    })();

    var prev = (function(){
        return startPage - 1 < 1 ? false : true;
    })();

    var next = (function(){
        return showCount * endPage >= total ? false : true;
    })();

    function makePage() {
        var str = "";

        if (prev) {
            str += tag.replace("%page", '<a class="btn" href="/loanbook/list?page=' + (startPage - 1) + '">Prev</a>');
        } else {
			str += tag.replace("%page", '<a class="btn" disabled>Prev</a>');
		}

        for (var i = startPage; i <= endPage; i++){
            str += tag.replace("%page", '<a class="btn" href="/loanbook/list?page=' + (i) + '">' + (i) + '</a>');
        }

        if (next) {
            str += tag.replace("%page", '<a class="btn" href="/loanbook/list?page=' + (endPage + 1) + '">Next</a>');
        }
        return str;
    }
    return makePage();
};