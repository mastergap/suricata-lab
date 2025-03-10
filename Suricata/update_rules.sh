#!/bin/sh
echo "🔄 Updating ET Open Suricata rules..."

# Scarica le regole aggiornate
wget -qO /tmp/emerging.rules.tar.gz https://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz

# Estrai le regole nella directory corretta
tar -xzf /tmp/emerging.rules.tar.gz -C /var/lib/suricata/rules --strip-components=2 --overwrite

# Rimuovi il file temporaneo
rm /tmp/emerging.rules.tar.gz

# Ricarica le regole senza riavviare il container
suricata --af-packet -r /var/lib/suricata/rules/emerging.rules

echo "✅ Rules successfully updated!"