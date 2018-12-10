def clean(x):
  return x.replace(':', '-').replace('/', '-')

def basename(x):
  return x.split('/')[-1]

def extract(rule, path): 
  name = clean('extract-' + rule + '-' + path)
  native.genrule(
    name = name, 
    out = basename(path), 
    cmd = 'cp $(location :' + rule + ')/' + path + ' $OUT', 
  )
  return ':' + name
