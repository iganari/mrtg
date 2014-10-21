#!/usr/bin/perl
#
# $to = 'igarshi@aucfan.com';
$to = 'afml_alert_m@aucfan.com';
$from = "mrtg\@aucfan-mrtg.com";
$subject = "[ Recovery ]  $ARGV[0] on $ENV{'HOST'}";

# open(MAIL,"|/usr/local/bin/nkf -j | /usr/sbin/sendmail -t -f $from");
# open(MAIL,"| sendmail -t -f $from");
open(MAIL,"| /etc/alternatives/mta-sendmail -t -f $from");

print MAIL "From: $from\n";
print MAIL "To: $to\n";
print MAIL "Subject: $subject\n\n";

print MAIL `date` . "$ARGV[0] が正常値に戻りました。\n";

print MAIL "------------------------------------------------- \n";
print MAIL "  閾値     : $ARGV[1] \n";
print MAIL "  現在の値 : $ARGV[2] \n";
print MAIL "------------------------------------------------- \n\n";

print MAIL "$ENV{'URL'} \n";
close(MAIL);
