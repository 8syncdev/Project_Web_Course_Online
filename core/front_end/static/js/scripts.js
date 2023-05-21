
// Check Admin Role:
const codeConfirm = document.getElementById('chooseRole')

codeConfirm.addEventListener('change', (e) => {
    const form = document.getElementById('codeConfirm')
    console.log(e.target.value)
    if (e.target.value === 'admin') {
        form.innerHTML = `
            <label for="code" class="form-label">Code</label>
            <input type="number" class="form-control" id="code" name="code">
        `
    }
    else {
        form.innerHTML = ''
    }
})


// Scroll to top page:

const scrollTop = document.getElementById('scrollToTop').addEventListener('click', () => {
    scrollToTop()
})

function scrollToTop() {
    var position =
        document.body.scrollTop || document.documentElement.scrollTop;
    if (position) {
        window.scrollBy(0, -Math.max(1, Math.floor(position / 10)));
        scrollAnimation = setTimeout("scrollToTop()", 30);
    } else clearTimeout(scrollAnimation);
}


// Table Index:
window.addEventListener('load', () => {
    const table = document.querySelectorAll('.idx')
    table.forEach((item, index) => {
        item.innerHTML = `<th>${index + 1}</th>`
    })
})

// Admin:
let val_box = `<label for="formInputId" class="form-label">Id</label>
                        <input type="text" class="form-control" id="formInputId" name="id" value="6">`
let box_edit = document.getElementById('box-update')
console.log(box_edit)
let edit = document.getElementsByClassName('admin-edit')
let req = document.getElementById('req-post')
console.log(req.baseURI)
let effect = () => {
    [...edit].forEach((item, idx) => {
        item.addEventListener('click', (e) => {
            console.log(e)
            box_edit.innerHTML = `<label for="formInputId" class="form-label">Id</label>
                        <input type="text" class="form-control" id="formInputId" name="id" value="${idx + 1}">`
            
        })
    })
}
effect()