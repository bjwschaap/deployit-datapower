deployit-datapower
==================

Deployit plugin for deploying processes to IBM DataPower.

This plugin requires a infrastructure/SshHost to use as a jumpstation. Deployit will
upload the configuration files of the DataPower process to this jumpstation, and
use the DataPower XML management interface (SOMA). See [documentation](http://www.redbooks.ibm.com/redpapers/pdfs/redp4446.pdf "XML Management Interface RedBook").
