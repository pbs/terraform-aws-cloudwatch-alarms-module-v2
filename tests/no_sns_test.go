package test

import (
	"testing"
)

func TestKinesisExample(t *testing.T) {
	testCloudWatchAlarm(t, "no-sns")
}
