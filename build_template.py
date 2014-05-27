#!/usr/bin/env python

import codecs
import json
import os
import sys

import tempita

work_dir      = os.path.dirname(__file__)
template_dir  = os.path.join(work_dir,'_templates')
build_dir     = os.path.join(work_dir,'_build')
data_dir      = os.path.join(work_dir,'data')
edu_conf      = os.path.join(data_dir, 'edu.json')
work_conf     = os.path.join(data_dir, 'work.json')
teach_conf     = os.path.join(data_dir, 'teaching.json')
present_conf  = os.path.join(data_dir, 'presentation.json')
service_conf  = os.path.join(data_dir, 'service.json')

def get_config():
    config = {'education': cfg2dict(edu_conf),
              'jobs': cfg2dict(work_conf),
              'teaching': cfg2dict(teach_conf),
              'presentations': cfg2dict(present_conf),
              'services': cfg2dict(service_conf)
    }
    return config

def cfg2dict(filename):
    """Return the content of a JSON config file as a dictionary.

    """
    if not os.path.exists(filename):
        print '*** Warning: %s does not exist.' % filename
        return {}
    return json.loads(codecs.open(filename, 'r', 'utf-8').read())

def _from_template(tmpl_basename, config):
    tmpl = os.path.join(template_dir, tmpl_basename + '.tmpl')
    template = tempita.HTMLTemplate(open(tmpl, 'r').read())
    return template.substitute(config)

def from_template(tmpl_basename, config, dest_fn):

    outfile = _from_template(tmpl_basename, config)
    extension = os.path.splitext(dest_fn)[1][1:]
    outname = os.path.join(build_dir, extension, dest_fn)

    with open(outname, mode='w') as f:
        f.write(outfile)

if __name__ == "__main__":

    if not len(sys.argv) == 2:
        print "Usage: build_template.py destination_name"
        sys.exit(-1)

    dest_fn = sys.argv[1]
    template_fn = os.path.join(template_dir, dest_fn+'.tmpl')

    if not os.path.exists(template_fn):
        print "Cannot find template."
        sys.exit(-1)

    config = get_config()
    from_template(dest_fn, config, dest_fn)
