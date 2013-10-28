$(document).ready ->
  rows = [
    $('#points-text-1'),
    $('#points-text-2'),
    $('#points-text-3'),
    $('#points-text-4'),
    $('#points-text-5')
  ]
  rowIndex = 0;
  $('#points-text-wrapper').click ->
    $prevRow = rows[rowIndex]
    rowIndex = (rowIndex + 1) % rows.length
    $nextRow = rows[rowIndex]
    $prevRow.fadeOut('fast', () -> $nextRow.fadeIn())
