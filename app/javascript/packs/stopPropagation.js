document.body.addEventListener('click', function (e) {
    console.log(e.target.className)
    if (String(e.target.className) == 'offcanvas-backdrop fade') {
        console.log("ok")
        document.body.querySelectorAll('.offcanvas-backdrop').forEach(function (a) {
            console.log("ok")
            a.remove()
        })
    }

})