function setRelativeTime() {
  const rts = document.getElementsByClassName('luxon-relative-time')
  const DateTime = luxon.DateTime
  
  for (const rtDiv of rts) {
    let iso = rtDiv.attributes["relative-time"].value
    rtDiv.innerText = DateTime.fromISO(iso).toRelative()
  }
}

setInterval(() => setRelativeTime(), 1000 * 1)
